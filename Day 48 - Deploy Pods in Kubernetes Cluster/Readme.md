### Task - Deploy Pods in Kubernetes Cluster

The Nautilus DevOps team is diving into Kubernetes for application management. One team member has a task to create a pod according to the details below:
- Create a pod named `pod-nginx` using the nginx image with the `latest` tag. Ensure to specify the tag as `nginx:latest`.
- Set the app label to `nginx_app`, and name the container as `nginx-container`.

### Solution - 

#### add the following to pod.yml:
```sh
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    app: nginx_app
  name: pod-nginx
spec:
  containers:
  - image: nginx:latest
    name: nginx-container
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
```
- [pod-nginx.yaml](pod-nginx.yaml)

#### Commands:
kubetcl apply -f pod.yml
kubectl get pods

#### Verify 
kubectl logs pod-nginx