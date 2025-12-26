### Task - Deploy MySQL on Kubernetes

Deploy a MySQL server on Kubernetes with persistent storage and secure credentials.
- Create a `PersistentVolume` `mysql-pv` with capacity `250Mi`.
- Create a `PersistentVolumeClaim` `mysql-pv-claim` requesting `250Mi`.
- Create a `Deployment mysql-deployment` using any `MySQL image` and mount the volume at `/var/lib/mysql`.
- Expose MySQL using a `NodePort` Service named `mysql` with nodePort `30007`.
- Create Kubernetes `Secrets` to store `MySQL root password`, `user credentials`, and `database name`.
- Configure the `MySQL container` to read these values using `environment variables from Secrets`.
Ensure the MySQL pod is running and accessible.

### Solution -
```sh
# MySQL root password
kubectl create secret generic mysql-root-pass \
  --from-literal=password=YUIidhb667

# MySQL user credentials
kubectl create secret generic mysql-user-pass \
  --from-literal=username=kodekloud_pop \
  --from-literal=password=ksH85UJjhb

# MySQL database name
kubectl create secret generic mysql-db-url \
  --from-literal=database=kodekloud_db6

kubectl get secret  
```
- [pv.yaml](./pv.yaml)
```sh
# Create pv with above content
kubectl apply -f pv.yaml
kubectl get pv
```
- [pvc.yaml](./pvc.yaml)
```sh
# Crete pvc with above content
kubectl apply -f pvc.yaml
kubectl get pvc
```
- [mysql-deployment.yaml](./mysql-deployment.yaml)
```sh
# Now create deployment 
kubectl apply -f mysql-deployment.yaml
kubectl get deployments
```
- [svc.yaml](./svc.yaml)
```sh
kubectl apply -f svc.yaml
kubectl get svc
```

```sh
# To verify
kubectl get pods
kubectl logs <pod-name>
```


