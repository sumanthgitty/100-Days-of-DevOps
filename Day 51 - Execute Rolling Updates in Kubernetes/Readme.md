### Task - Execute Rolling Updates in Kubernetes

An application currently running on the Kubernetes cluster employs the nginx web server. The Nautilus application development team has introduced some recent changes that need deployment. They've crafted an `image nginx:1.18` with the latest updates.
- Execute a rolling update for this application, integrating the `nginx:1.18` image. The deployment is named `nginx-deployment`.
- Ensure all pods are operational post-update.

### Solution - 

#### commands:
```sh
# We can use kubectl set image to update image to new version, to update resources we can use set resources 

kubectl get deployments

kubectl set image deployment/nginx-deployment nginx-container=nginx:1.18

# To verify 
kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment

# Make sure pods are running after udpate
kubectl get pods 
```