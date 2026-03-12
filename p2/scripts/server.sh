apt update -y
apt upgrade -y

apt install -y curl

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--bind-address 192.168.56.110 --node-ip 192.168.56.110 --tls-san 192.168.56.110" sh -

echo "192.168.56.110 app1.com app2.com app3.com" | sudo tee -a /etc/hosts

sudo kubectl apply -f /vagrant/confs/app.yaml
sudo kubectl apply -f /vagrant/confs/ingress.yaml

#kubectl get ingress Pour voir le traefik