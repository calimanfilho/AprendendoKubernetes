echo "Criando as imagens..."

docker build -t calimanfilho/projeto-backend:1.0 backend/.
docker build -t calimanfilho/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push calimanfilho/projeto-backend:1.0
docker push calimanfilho/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes.."

kubectl apply -f ./services.yaml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yaml