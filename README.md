# Lavanet

## ISBN API - Infrastructure

This IaaC repository contains Terraform and YAML configuration files for Kubernetes. This infrastructure deploys a high-available and fault-tolerant solution to host the ISBN REST API.

![Diagram](https://github.com/luis02lopez/lavanet-challenge-infra/blob/main/Lavanet%20Challenge%20Infrastructure%20Diagram%20-%20v1.png)

_Requirements_

- Terraform `v1.2.4`
- Kubectl `v1.25.2`

### ✨Nice features✨

- IaaC with Terraform
- Autoscaling
- Backend versions -- capacity for more than 2 servers
- 99.99% uptime with AWS ALB
- Secure infrastructure with private subnets
- Industry's best practices

## Getting started

Create the infrastructure with Terraform:

    terraform init
    terraform apply

Apply all the Kubernetes configurations:

    kubectl apply -f /k8s

Visit http://k8s-isbnback-ingressb-68bbbd9d6e-1621588120.us-east-1.elb.amazonaws.com/

### 🤝Contributions to the community🤝

In the process of setting up the challenge, a bug has been found and reported: https://github.com/kubernetes-sigs/aws-load-balancer-controller/issues/2851

## Contributors

- Luis Lopez
