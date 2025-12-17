### Task - Troubleshoot Deployment issues in Kubernetes

The Nautilus DevOps team reported that an existing Redis application deployed on the Kubernetes cluster is not running. The deployment was previously working, but recent changes caused the pods to go down.
- Deployment name: `redis-deployment`
- Pods are not in Running state
- Identify and fix the issue to restore the application

### Solution - 

```sh
kubectl get deployments
kubectl describe deployment redis-deployment
kubectl describe pod <pod-name>
kubectl get configmap                       # To verify correct cm name
```
#### Root Cause:

- Wrong image name: `redis:alpin`
- Wrong ConfigMap name: `redis-cofig`

#### Fix:

- Changed image to `redis:alpine`
- Changed ConfigMap to `redis-config`

### Verification:
```sh
kubectl get pods
kubectl get deployment redis-deployment
```

- [corrected-deployment.yaml](./deployment.yaml)