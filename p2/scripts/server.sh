apt update -y
apt upgrade -y

apt install -y curl

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--bind-address 192.168.56.110 --node-ip 192.168.56.110 --tls-san 192.168.56.110" sh -

kubectl apply -f confs/app.yaml