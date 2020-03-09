# This folder container all manifests about k8s

## Folder structure
- `config.yaml` is the kubectl config, should copy it to ~/.kube/config when used in Travis to config the kubectl with remote k8s-cluster.
- `ingress.yaml` is a ingress resource in k8s to lead external traffic into our services.
- `k8s-pod.yaml` is manifest of our services & deployments

## Important NOTE
- Should install MetalLB to work with ingress in microK8s/minikube env
> Kubernetes does not offer an implementation of network load-balancers (Services of type LoadBalancer) for bare metal clusters. The implementations of Network LB that Kubernetes does ship with are all glue code that calls out to various IaaS platforms (GCP, AWS, Azure…). If you’re not running on a supported IaaS platform (GCP, AWS, Azure…), LoadBalancers will remain in the “pending” state indefinitely when created.
> Bare metal cluster operators are left with two lesser tools to bring user traffic into their clusters, “NodePort” and “externalIPs” services. Both of these options have significant downsides for production use, which makes bare metal clusters second class citizens in the Kubernetes ecosystem.
> MetalLB aims to redress this imbalance by offering a Network LB implementation that integrates with standard network equipment, so that external services on bare metal clusters also “just work” as much as possible.

```bash
# enable ingress
microk8s.enable ingress dns || minikube addons enable ingress
# installation(https://metallb.universe.tf/installation/):
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.3/manifests/metallb.yaml
# apply configMap(demo follows) for metallb (https://metallb.universe.tf/configuration/)
kubectl apply -f metallb_config.yaml

# apply ingress
kubectl apply -f ./ingress.yaml
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - <IPs to be bound to the network interfaces of your worker nodes>
```