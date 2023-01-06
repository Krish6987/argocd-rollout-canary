# argocd-rollout-canary

This repository has the code on how to make a rollout to the new version with canary analysis.

## Steps on how to run and deploy

This is a simple hello world web application developed in golang.

Firstly build a docker image with the Dockerfile

```
docker build -t go-sample-app:1.0.0 .
```

Update the go-lang code and build a new docker image with version 2.0.0 as tag

Install Argo CD CRD with the below commands on your k8s cluster. If you are using local k8s cluster also you can run these commands.

```
kubectl create namespace argo-rollouts

kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
```

Install Argo CD kubectl plugin from the official documentation of Argo.

The manifests are available in manifests directory, apply them with kubectl command. Once the deployment and service are running open your browser and open below url and see the version.

```
http://localhost:8081/
```

Update the version in deployment.yaml and apply the new deployment.

You can see the rollout status of the app by running below command

```
kubectl argo rollouts get rollout hello-world --watch
```

There a run.sh file which you can run and see how the traffic will be switched from version 1 to version 2 gradually if the analysis is going good.
