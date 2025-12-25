### Task - Deploy Redis Deployment on Kubernetes

The Nautilus team decided to deploy Redis as an in-memory cache to improve application performance in Kubernetes.

- Create a `ConfigMap` named `my-redis-config` with `redis-config=maxmemory 2mb`.
- Create a Deployment named `redis-deployment` using image `redis:alpine` with container name `redis-container` and `1 replica`.
Set a `CPU request of 1 core`, mount an `emptyDir` volume `data` at `/redis-master-data`, and mount the `ConfigMap redis-config` at `/redis-master`.
- Expose Redis on port `6379` and ensure the deployment is running.

### Solution - 
```sh
kubectl create configmap my-redis-config --from-literal=redis-config="maxmemory 2mb"
kubectl get cm
kubectl describe cm my-redis-config
```
- [redis-deployment.yaml](./redis-deployment.yaml)
```sh
kubectl apply -f redis-deployment.yaml
kubectl get deployments

# To verify 
k exec -it <pod-name> -- redis-cli ping          # you will get an reponse of PONG
```
