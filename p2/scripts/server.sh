apt update -y
apt upgrade -y

apt install -y curl

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--bind-address 192.168.56.110 --node-ip 192.168.56.110 --tls-san 192.168.56.110" sh -

echo "192.168.56.110 app1.com app2.com app3.com" | sudo tee -a /etc/hosts

sudo kubectl apply -f /vagrant/confs/app.yaml
sudo kubectl apply -f /vagrant/confs/ingress.yaml


sleep 10

# sudo kubectl cp /vagrant/confs/index1.html default/app1-service:/usr/share/nginx/html/index.html
# sudo kubectl cp /vagrant/confs/index2.html default/app2-service:/usr/share/nginx/html/index.html
# sudo kubectl cp /vagrant/confs/index3.html default/app3-service:/usr/share/nginx/html/index.html