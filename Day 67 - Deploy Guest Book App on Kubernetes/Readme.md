### Task - Deploy Guest Book App on Kubernetes

Deploy the Guestbook application on Kubernetes using a Redis backend and a frontend service.

**Backend Tier**
- Create a Redis master Deployment `redis-master` with `1 replica`, container `master-redis-devops`, `image redis`, resource requests `cpu: 100m, memory: 100Mi`, and `port 6379`.
- Expose it using a Service `redis-master` on `port 6379`.
- Create a Redis slave Deployment `redis-slave` with `2 replicas`, container `slave-redis-devops`, `image gcr.io/google_samples/gb-redisslave:v3`, resource requests `cpu: 100m, memory: 100Mi`, environment variable `GET_HOSTS_FROM=dns`, and `port 6379`.
- Expose it using a Service `redis-slave` on `port 6379`.

**Frontend Tier**
- Create a frontend Deployment `frontend` with `3 replicas`, container `php-redis-devops`, `image gcr.io/google-samples/gb-frontend@sha256:a908df8486ff66f2c4daa0d3d8a2fa09846a1fc8efd65649c0109695c7c5cbff`, resource requests `cpu: 100m, memory: 100Mi`, environment variable `GET_HOSTS_FROM=dns`, and `port 80`.
- Expose the frontend using a `NodePort` Service frontend on port `80` with `nodePort 30009`.

### Solution - 

#### Manifest file -
- [GuestBook.yaml](./guestbook.yaml)

#### Apply & Verify
```sh
kubectl apply -f guestbook.yaml
kubectl get deployments
kubectl get svc
kubectl get pods
```

#### Access the app
```sh
# Click the App button

# Or

# Open in browser:

<NodeIP>:30009

```