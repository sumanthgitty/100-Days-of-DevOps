### Task - Init Containers in Kubernetes

Create a Deployment `named ic-deploy-nautilus` with `1 replica` and label `app=ic-nautilus`.
- Add an `init container` named `ic-msg-nautilus` using image `debian:latest` that writes a message to `/ic/news` using a shared `emptyDir volume` `ic-volume-nautilus` mounted at `/ic`.
- Add a main container named `ic-main-nautilus` using image `debian:latest` that continuously reads `/ic/news` every `5 seconds` using the `same shared volume`.

### Solution -

### Add the following:
```sh
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: ic-nautilus
  name: ic-deploy-nautilus
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-nautilus
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ic-nautilus
    spec:
      initContainers:
      - image: debian:latest
        name: ic-msg-nautilus
        command:
        - /bin/bash
        - -c
        - echo Init Done - Welcome to xFusionCorp Industries > /ic/news
        volumeMounts:
        - mountPath: /ic
          name: ic-volume-nautilus
      containers:
      - image: debian:latest
        imagePullPolicy: Always
        name: ic-main-nautilus
        command:
        - /bin/bash
        - -c
        - while true; do cat /ic/news; sleep 5; done
        volumeMounts:
        - mountPath: /ic
          name: ic-volume-nautilus
        
      volumes:
      - name: ic-volume-nautilus
        emptyDir: {}
status: {}
```
- [deployment.yaml](./deployment.yaml)

### Commands:
```sh
kubectl apply -f deployment.yaml
kubectl get deployments
kubectl get pods

# To verify
kubectl exec -it <pod-name> -c <main-container-name> -- cat /ic/news                         # It will display "Init Done - Welcome to xFusionCorp Industries" 
```
