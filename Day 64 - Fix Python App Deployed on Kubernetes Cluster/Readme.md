### Task - Fix Python App Deployed on Kubernetes Cluster

One of the DevOps engineers was trying to deploy a python app on Kubernetes cluster. Unfortunately, due to some mis-configuration, the application is not coming up. Please take a look into it and fix the issues. Application should be accessible on the specified nodePort.
- The deployment name is `python-deployment-datacenter`, its using `poroko/flask-demo-appimage`. The deployment and service of this app is already deployed.
- nodePort should be `32345` and targetPort should be python flask app's default port.

### Solution - 

```sh
k get deployments 
k describe deployment python-deployment-datacenter

# Image name was wrong chnage it to correct name
k edit deployment python-deployment-datacenter
```
```sh
k get svc 
k describe svc <svc-name>

# Target port is wrong so change it to correct port (Flask apps run on port 5000 so change target port)
k edit svc <svc-name>
```
