#!/bin/bash

echo "🚀 Déploiement de Redis principal et réplicas..."
kubectl apply -f Redis/redis-deployment.yml
kubectl apply -f Redis/redis-service.yml
kubectl apply -f Redis/redis-replica-deployment.yml
kubectl apply -f Redis/redis-replica-service.yml
kubectl apply -f Redis/redis-replica-hpa.yml

echo "🚀 Déploiement du backend Node.js..."
kubectl apply -f NodeJs/node-deployment.yml
kubectl apply -f NodeJs/node-service.yml
kubectl apply -f NodeJs/node-hpa.yml

echo "🚀 Déploiement du frontend React..."
kubectl apply -f React/react-deployment.yml
kubectl apply -f React/react-service.yml

echo "📊 Déploiement du monitoring (Prometheus et Grafana)..."
kubectl apply -f monitoring/prometheus-configmap.yml
kubectl apply -f monitoring/prometheus-deployment.yml
kubectl apply -f monitoring/prometheus-service.yml
kubectl apply -f monitoring/grafana-deployment.yml
kubectl apply -f monitoring/grafana-service.yml

echo "✅ Tout est déployé ! 🎉"
