#Enable Horizontal Autoscaling
kubectl autoscale deployment isbn-backend-server-1-deployment --cpu-percent=80 --min=1 --max=4
kubectl autoscale deployment isbn-backend-server-2-deployment --cpu-percent=80 --min=1 --max=4