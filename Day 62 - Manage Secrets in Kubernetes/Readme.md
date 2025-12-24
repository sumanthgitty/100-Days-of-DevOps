### Task - secert

The Nautilus DevOps team needs to securely store license information using Kubernetes Secrets.
- Create a `generic secret` named `official` from the file `/opt/official.txt`.
- Create a pod named `secret-devops` with container `secret-container-devops` using image `ubuntu:latest`, running a `sleep` command to stay active.
- Mount the secret inside the `container` at `/opt/cluster` and verify the secret by exec into the container and checking the mounted file.

### Solution - 
```sh
k create secret generic official --from-file=/opt/official.txt
k get secret
```
- [pod.yaml](pod.yaml)
```sh
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  name: secret-devops
spec:
  containers:
  - image: ubuntu:latest
    name: secret-container-devops
    command: 
    - sh
    - -c
    - sleep 3600
    volumeMounts:
    - name: official
      mountPath: /opt/cluster 
    resources: {}
  
  volumes:
  - name: official
    secret:
      secretName: official
```
```sh
k apply -f pod.yaml
k get pods

k exec -it secret-devops -c secret-container-devops -- cat /opt/cluster/official.txt
```



