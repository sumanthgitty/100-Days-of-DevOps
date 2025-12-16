### Task - Kubernetes Shared Volumes

Create a pod named `volume-share-xfusion` with two containers using the `image fedora:latest`.
- Container `volume-container-xfusion-1` should run a `sleep` command and mount a shared emptyDir volume named `volume-share at /tmp/ecommerce`.
- Container `volume-container-xfusion-2` should run a `sleep` command and mount the same volume at `/tmp/games`.
- After creating the pod, `exec` into `volume-container-xfusion-1`, create a file `ecommerce.txt` under `/tmp/ecommerce`, and verify that the same file is visible in `/tmp/games` inside `volume-container-xfusion-2`.

### Solution - 

#### Add the follwing content to pod.yaml:
- [pod.yaml](./pod.yaml)
```sh
apiVersion: v1
kind: Pod
metadata:
  name: volume-share-xfusion
spec:
  containers:
  - name: volume-container-xfusion-1
    image: fedora:latest
    command: ["sleep", "3600"]
    volumeMounts:
    - name: volume-share
      mountPath: /tmp/ecommerce

  - name: volume-container-xfusion-2
    image: fedora:latest
    command: ["sleep", "3600"]
    volumeMounts:
    - name: volume-share
      mountPath: /tmp/games

  volumes:
  - name: volume-share
    emptyDir: {}

  restartPolicy: Always
```

#### Commands:
```sh
kubectl apply -f pod.yaml

# Verify pod is running with 2 containers
kubectl get pod volume-share-xfusion

# Create ecommerce.txt inside container 1  
kubectl exec -it volume-share-xfusion -c volume-container-xfusion-1 -- \
  sh -c 'echo "test" > /tmp/ecommerce/ecommerce.txt'

# Verify the created file in container 2
kubectl exec -it volume-share-xfusion -c volume-container-xfusion-2 -- \
  ls /tmp/games
```
