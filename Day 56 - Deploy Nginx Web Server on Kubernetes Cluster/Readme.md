### Task - Deploy Nginx Web Server on Kubernetes Cluster

Create a `Deployment named nginx-deployment` using image `nginx:latest` with `3 replicas` and container name `nginx-container`.

Expose the Deployment using a `NodePort Service` named `nginx-service` with `nodePort 30011`.

### Solution - 

#### Add the following to deployment.yaml and service.yaml:

- [nginx-deployment.yaml](./nginx-deployment.yaml)
- [nginx-service.yaml](./nginx-service.yaml)

#### Commands:
```sh
kubectl apply -f nginx-deployment.yaml
kubectl get deployments 

kubectl apply -f nginx-service.yaml
kubectl get svc
```

