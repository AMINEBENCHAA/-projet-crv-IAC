README.md

 Projet CRV - IAC
Présentation

Ce projet met en œuvre une architecture cloud-native complète composée de Redis (avec réplication), Node.js (stateless backend), React (frontend), Prometheus et Grafana pour le monitoring, le tout orchestré via Kubernetes avec autoscaling dynamique.

Technologies utilisées

Kubernetes : orchestration des conteneurs

Redis : base de données clé/valeur (master + replicas)

Node.js : backend stateless accédant à Redis

React : frontend léger

Prometheus : collecte de métriques

Grafana : visualisation des métriques

🛠️ Déploiement de l'infrastructure

Assurez-vous que minikube et kubectl sont installés.

# Démarrer Minikube
minikube start

# Activer le metrics-server (pour l'autoscaling)
minikube addons enable metrics-server

# Lancer le déploiement complet\./scripts/deploy-all.sh

🌐 Accès aux services

minikube service react-service     # Accès à l'application web
minikube service node-service      # Accès à l'API Node.js
minikube service prometheus        # Interface Prometheus
minikube service grafana           # Interface Grafana (admin/admin)

📈 Autoscaling

Le HPA est activé sur :

Redis replicas : redis-replica-hpa.yml

Node.js backend : node-hpa.yml

Vérifier :

kubectl get hpa
kubectl top pod

📊 Monitoring

Prometheus scrape automatiquement /metrics sur node-service

Grafana se connecte à Prometheus comme source de données

🐳 Docker

Les Dockerfiles sont inclus :

NodeJs/Dockerfile

React/Dockerfile

Build des images :

cd NodeJs
docker build -t <votre-dockerhub>/node-redis:1.0.0 .
docker push <votre-dockerhub>/node-redis:1.0.0

cd ../React
docker build -t <votre-dockerhub>/react-frontend:1.0.0 .
docker push <votre-dockerhub>/react-frontend:1.0.0

📄 Rapport

Un rapport PDF est fourni (rapport.pdf) expliquant l'architecture, les choix techniques, et la reproductibilité du projet.

🙌 Auteurs

BENCHAA Amine

Ce projet a été réalisé dans le cadre du cours CRV - ESI SBA, 2025.

Besoin d’aide ? Contactez-moi sur GitHub ou via email.

