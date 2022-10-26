#Open source contribution from this challenge
## https://github.com/kubernetes-sigs/aws-load-balancer-controller/issues/2851

#Enable Horizontal Autoscaling
kubectl autoscale -n isbn-backend deployment deployment-backend --cpu-percent=80 --min=1 --max=4
kubectl autoscale -n isbn-backend deployment deployment-backend-2 --cpu-percent=80 --min=1 --max=4

#Helm installation
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=lavanet \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller --set region=us-east-1 --set vpcId=vpc-06b3a1f7d010705ca

#Get Cluster to terminal
eksctl utils write-kubeconfig --cluster=lavanet

#Annotate service account
kubectl annotate serviceaccount -n kube-system aws-load-balancer-controller eks.amazonaws.com/role-arn=arn:aws:iam::392232677325:role/load-balancer-controller
