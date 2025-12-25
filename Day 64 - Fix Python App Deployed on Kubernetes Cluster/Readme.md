### Task - 

One of the DevOps engineers was trying to deploy a python app on Kubernetes cluster. Unfortunately, due to some mis-configuration, the application is not coming up. Please take a look into it and fix the issues. Application should be accessible on the specified nodePort.
- The deployment name is `python-deployment-datacenter`, its using `poroko/flask-demo-appimage`. The deployment and service of this app is already deployed.
- nodePort should be `32345` and targetPort should be python flask app's default port.

### Question - 

```sh
k get deployments 
k describe deployment python-deployment-datacenter

# image name was wrong chnage it to correct name
k edit deployment python-deployment-datacenter
```
```sh
k get svc 
k describe svc <svc-name>

# target port is wrong so chnage it to correct (python container port is 5000 so chnage target port)
k edit svc <svc-name>
```
