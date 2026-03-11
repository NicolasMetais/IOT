sudo kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo k3d cluster delete IOT
sudo kubectl delete namespace argocd dev --ignore-not-found

sudo rm -rf ~/.kube/config
sudo rm -rf /etc/kubernetes

sudo systemctl stop docker
sudo dpkg --configure -a
sudo apt remove --purge -y docker-ce docker-ce-cli containerd.io
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd

sudo apt autoremove -y
sudo apt clean -y

sudo kubectl delete namespace argocd dev --ignore-not-found

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y kubectl

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker $USER

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

sudo k3d cluster create IOT --port "8888:8888@loadbalancer" --wait

sudo kubectl create namespace argocd

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml --server-side

sudo kubectl wait --for=condition=available deployment/argocd-server -n argocd --timeout=300s

sudo kubectl create namespace dev
sudo kubectl wait --for=condition=established crd/applications.argoproj.io -n argocd --timeout=60s

sudo kubectl apply -f confs/deployment.yaml

sudo kubectl port-forward svc/argocd-server -n argocd 8080:443 & 
echo $(sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)


