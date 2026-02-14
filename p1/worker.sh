apt update -y
apt upgrade -y

apt install -y curl

TOKEN=$(cat /vagrant/k3s)

curl -sfL https://get.k3s.io | K3S_URL="https://192.168.56.110:6443" K3S_TOKEN=$TOKEN sh -