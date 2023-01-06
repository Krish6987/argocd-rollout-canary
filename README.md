# argocd-rollout-canary

This repository has the code on how to make a rollout to the new version with canary analysis.

## Steps on how to run and deploy

This is a simple hello world web application developed in golang.

Firstly build a docker image with the Dockerfile

```
docker build -t go-sample-app:1.0.0 .
```

Update the go-lang code and build a new docker image with version 2.0.0 as tag

