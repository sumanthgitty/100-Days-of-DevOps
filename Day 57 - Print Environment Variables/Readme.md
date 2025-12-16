### Task - Print Environment Variables

Create a pod named `print-envars-greeting` using the `bash image` with container name `print-env-container`.
- Set environment variables:
  - `GREETING=Welcome to`
  - `COMPANY=DevOps`
  - `GROUP=Industries`
- Run the command: `["/bin/sh", "-c", "echo \"$(GREETING) $(COMPANY) $(GROUP)\""]`
- Set `restartPolicy: Never`

### Solution:

#### Add the following to yaml:

- [pod.yaml](./pod.yaml)
```sh
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  name: print-envars-greeting
spec:
  containers:
  - image: bash:latest
    name: print-env-container
    env:
    - name: GREETING
      value: "Welcome to"
    - name: COMPANY
      value: "DevOps"
    - name: GROUP 
      value: "Industries"
    command: ["/bin/sh", "-c", 'echo "$(GREETING) $(COMPANY) $(GROUP)"']
  restartPolicy: Never
```

#### Commands:
```sh
kubectl apply -f pod.yaml

kubectl logs -f print-envars-greeting                   # You will get "Welcome to DevOps Industries"
```
