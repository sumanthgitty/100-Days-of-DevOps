### Task - Deploy Grafana on Kubernetes Cluster

The Nautilus DevOps teams is planning to set up a Grafana tool to collect and analyze analytics from some applications. They are planning to deploy it on Kubernetes cluster. Below you can find more details.
- Create a deployment named `grafana-deployment-xfusion` using any `grafana image` for Grafana app. Set other parameters as per your choice.
- Create `NodePort` type service with nodePort `32000` to expose the app.

### Solution -

#### Add the following content:

- [grafana.yaml](./grafana.yaml)

#### Commands:
```sh
kubectl apply -f grafana.yaml
kubectl get deployments
kubectl get svc
kubectl get pvc
```

**ref** - https://grafana.com/docs/grafana/latest/setup-grafana/installation/kubernetes/