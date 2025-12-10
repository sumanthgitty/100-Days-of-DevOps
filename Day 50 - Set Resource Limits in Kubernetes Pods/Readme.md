### Task - Set Resource Limits in Kubernetes Pods

The Nautilus DevOps team has noticed performance issues in some Kubernetes-hosted applications due to resource constraints. To address this, they plan to set limits on resource utilization. Here are the details:
- Create a pod named `httpd-pod` with a container named `httpd-container`. Use the `httpd image` with the `latest` tag (specify as httpd:latest). 
- Set the following `resource limits`:
  - Requests: Memory: 15Mi, CPU: 100m
  - Limits: Memory: 20Mi, CPU: 100m

### Solution - 

#### Add the following to pod yaml:
```sh
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  name: httpd-pod
spec:
  containers:
  - image: httpd:latest
    name: httpd-container
    resources: 
      requests:
        memory: "15Mi"
        cpu: "100m"
      limits:
        memory: "20Mi"
        cpu: "100m"
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```
- [pod.yml](pod.yml)

#### Commands:
```sh
kubectl apply -f pod.yaml
kubectl get pods
```