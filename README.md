#  Projet CRV - IAC

##  Présentation

Ce projet met en œuvre une **architecture cloud-native** complète composée de :

- **Redis** (avec réplication)
- **Node.js** (backend stateless)
- **React** (frontend)
- **Prometheus** & **Grafana** (monitoring)

Le tout est **orchestré via Kubernetes** avec un **autoscaling dynamique**.

---

##  Technologies utilisées

-  **Kubernetes** : orchestration des conteneurs  
-  **Redis** : base de données clé/valeur (master + replicas)  
-  **Node.js** : backend stateless accédant à Redis  
-  **React** : frontend léger  
-  **Prometheus** : collecte de métriques  
-  **Grafana** : visualisation des métriques  

---

##  Déploiement de l'infrastructure

> Prérequis : `minikube` et `kubectl` installés.

```bash
# Démarrer Minikube
minikube start

# Activer le metrics-server (pour l'autoscaling)
minikube addons enable metrics-server

# Lancer le déploiement complet
./scripts/deploy-all.sh
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

# Monitoring

Prometheus scrape automatiquement /metrics sur node-service

Grafana se connecte à Prometheus comme source de données



cd ../React
docker build -t <votre-dockerhub>/react-frontend:1.0.0 .
docker push <votre-dockerhub>/react-frontend:1.0.0

