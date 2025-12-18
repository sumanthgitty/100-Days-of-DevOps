### Task - Persistent Volumes in Kubernetes

The Nautilus DevOps team is working on a Kubernetes template to deploy a web application on the cluster. There are requirements to create and use persistent volumes to store the application code.
- Create a PersistentVolume named `pv-devops` using `hostPath` at `/mnt/security` with `5Gi` capacity, `ReadWriteOnce` access mode, and storage class `manual`.
- Create a `PersistentVolumeClaim` named `pvc-devops` requesting `1Gi storage` with `ReadWriteOnce` access mode and storage class `manual`.
- Create a Pod named `pod-devops` with container `container-devops` using image `httpd:latest`, and mount the PVC at the web server `document root`.
- Expose the web server using a NodePort Service named `web-devops` with `node port 30008`.

### Solution -

#### manifest file:
```sh
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-devops
spec:
  capacity:
    storage: 5Gi
  volumeMode: Filesystem
  accessModes:
  - ReadWriteOnce
  storageClassName: manual
  hostPath:
    path: /mnt/security
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-devops
spec:
  storageClassName: manual
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Pod
metadata:
  name: pod-devops
  labels:
    app: pod-devops
spec:
  containers:
  - name: container-devops
    image: httpd:latest
    ports:
    - containerPort: 80
    volumeMounts:
    - mountPath: /usr/local/apache2/htdocs
      name: pv-devops-storage
  volumes:
    - name: pv-devops-storage
      persistentVolumeClaim:
        claimName: pvc-devops
---
apiVersion: v1
kind: Service
metadata:
  name: web-devops
spec:
  selector:
    app: pod-devops
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30008
  type: NodePort
```
- [webapp.yaml](./pv-pvc-pod.yaml)

#### Commands:
```sh
kubectl apply -f webapp.yaml

kubectl get pv,pvc,pods,svc 
```