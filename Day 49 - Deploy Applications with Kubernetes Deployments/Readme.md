### Task - Deploy Applications with Kubernetes Deployments

The Nautilus DevOps team is delving into Kubernetes for app management. One team member needs to create a deployment following these details:
- Create a deployment named `httpd` to deploy the application `httpd` using the `image httpd:latest` (ensure to specify the tag)

### Solution - 

#### Add the follwoing to yaml
```sh
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: httpd
  name: httpd
spec:
  replicas: 1
  selector:
    matchLabels:
      app: httpd
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: httpd
    spec:
      containers:
      - image: httpd:latest
        name: httpd
        resources: {}
status: {}
```
- [deployment.yml](./deployment.yml)

#### Commands:
```sh
kubectl apply -f deployment.yml
kubectl get deployments
```
