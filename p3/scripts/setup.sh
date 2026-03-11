sudo apt-get remove --purge -y kubectl
sudo apt-get autoremove -y

sudo apt-get remove --purge -y docker-ce docker-ce-cli containerd.io
sudo apt-get autoremove -y

sudo rm -rf $(which k3d)

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y kubectl

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo usermod -aG docker $USER

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

sudo k3d cluster create IOT --port "8888:8888@loadbalancer"

sudo kubectl create namespace argocd

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

sudo kubectl create namespace dev

sudo kubectl apply -f confs/deployment.yml

kubectl port-forward svc/argocd-server -n argocd 8080:443
