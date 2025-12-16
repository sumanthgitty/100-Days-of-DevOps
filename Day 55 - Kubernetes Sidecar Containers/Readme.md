### Task - Kubernetes Sidecar Containers

Create a Pod that demonstrates the Sidecar pattern for log aggregation using a shared volume.
- Create a pod named `webserver`
- Create an `emptyDir` volume named `shared-logs`
- Add two containers:
  - `nginx-container` using image `nginx:latest`
  - `sidecar-container` using image `ubuntu:latest`
- Mount the shared volume at `/var/log/nginx` in both containers
- Configure the sidecar container to continuously read Nginx access and error logs using:
```sh
sh -c "while true; do cat /var/log/nginx/access.log /var/log/nginx/error.log; sleep 30; done"
```

### Solution - 

#### Add the following content to pod.yaml:
- [pod.yaml](./pod.yaml)
```sh
apiVersion: v1
kind: Pod
metadata:
  name: webserver
spec:
  containers:
  - name: nginx-container
    image: nginx:latest
    volumeMounts:
    - name: shared-logs
      mountPath: /var/log/nginx

  - name: sidecar-container
    image: ubuntu:latest
    command: ["sh","-c","while true; do cat /var/log/nginx/access.log /var/log/nginx/error.log; sleep 30; done"]
    volumeMounts:
    - name: shared-logs
      mountPath: /var/log/nginx

  volumes:
  - name: shared-logs
    emptyDir: {}

  restartPolicy: Always
```

#### Commands:
```sh
# Create the pod
kubectl apply -f pod.yaml

# Verify pod and containers
kubectl get pod webserver

# Check logs from sidecar container
kubectl logs webserver -c sidecar-container

kubectl exec webserver -c sidecar-container -- cat /var/log/nginx/access.log
```

#### Explanation:

- Nginx container writes access and error logs to /var/log/nginx
- Sidecar container reads the same logs from the shared emptyDir volume
- Both containers share the same filesystem path via the shared volume
- This follows the separation of concerns principle:
  - Nginx serves web traffic
  - Sidecar handles log reading/shipping