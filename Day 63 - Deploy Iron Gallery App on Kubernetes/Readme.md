### Task - Deploy Iron Gallery App on Kubernetes

Deploy the Iron Gallery application and its database on a Kubernetes cluster with proper namespace isolation, resource limits, volumes, and services.

- Create a `namespace` `iron-namespace-nautilus`.
- Deploy `iron gallery` as `iron-gallery-deployment-nautilus` in the same namespace with `1 replica` and label `run=iron-gallery`.
Use `container iron-gallery-container-nautilus` with image `kodekloud/irongallery:2.0`, set resource limits `CPU 50m` and `memory 100Mi`, and mount two emptyDir volumes:
 - config - /usr/share/nginx/html/data
 - images - /usr/share/nginx/html/uploads
- Deploy iron DB as `iron-db-deployment-nautilus` with `1 replica` and label `db=mariadb`.
Use container `iron-db-container-nautilus` with image `kodekloud/irondb:2.0`, configure required MySQL environment variables, and mount an emptyDir volume db at `/var/lib/mysql`.
- Create a `ClusterIP` Service iron-db-service-nautilus exposing MySQL on port `3306`.
- Create a `NodePort` Service iron-gallery-service-nautilus exposing the gallery on port `80` with nodePort `32678`.

### Solution -
```sh
kubectl create namespace iron-namespace-nautilus
kubectl get namespace
```
- [app-deployment.yaml](./app-deployment.yaml)
```sh
kubectl apply -f app-deployment.yaml
kubectl get deployments 
```
- [db-deployment.yaml ](./db-deployment.yaml)
```sh
kubectl apply -f db-deployment.yaml
kubectl get deployments
``` 
- [appsvc.yaml](./app-svc.yaml) 
- [dbsvc.yaml](./db-svc.yaml) 
```sh
kubectl apply -f appsvc.yaml
kubectl apply -f dbsvc.yaml

kubectl get svc
```
