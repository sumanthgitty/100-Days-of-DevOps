### Task - Revert Deployment to Previous Version in Kubernetes

Earlier today, the Nautilus DevOps team deployed a new release for an application. However, a customer has reported a bug related to this recent release. Consequently, the team aims to `revert to the previous version`.
- There exists a deployment named `nginx-deployment`; initiate a rollback to the `previous revision`.

### Solution - 

#### Commands:
```sh
# Check existing deployments
kubectl get deployment

# To rollback, we can use kubectl rollout undo or kubectl rollout undo --to-revision=<num> to revert to a specific revision

kubectl rollout undo deployment/nginx-deployment

# To verify
kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment
```