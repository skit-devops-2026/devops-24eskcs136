# Organizr

## Author

| Roll No. | Name | GitHub username |
|---|---|---|
| 24ESKCS136 | Girjakant| girja13 |

## About

Organizr is a task management web application that allows users to create, manage, search, update, and delete tasks. It provides a centralized platform for organizing tasks and managing work efficiently.

## Tech stack

- Frontend: HTML, CSS, JavaScript, Bootstrap
- Backend: PHP (Apache)
- Database: MySQL 8.0
- Containerization: Docker, Docker Compose
- Orchestration: Kubernetes
- Monitoring: Prometheus & Grafana

## Running locally

```bash
make install
make docker-build
make docker-up
```

Access the local services:
- Web Application: http://localhost:8081
- Prometheus Monitoring: http://localhost:9090
- Health Endpoint: http://localhost:8081/health
- Metrics Endpoint: http://localhost:8081/metrics

## Live URL

https://skit-devops-2026.github.io/devops-24eskcs136/

## Container Registry

The container image is automatically built and published to GitHub Container Registry (GHCR):

```bash
docker pull ghcr.io/skit-devops-2026/devops-24eskcs136:latest
```

## Health endpoint

`GET /health` returns JSON containing the application status and running commit SHA:

```json
{
  "status": "UP",
  "app": "Organizr Task Management System",
  "version": "1.0.0",
  "commit": "d975599"
}
```

## Metrics endpoint

`GET /metrics` returns Prometheus format metrics including uptime, memory usage, request counts, and task statistics.

## Kubernetes Deployment

Deploy application and service to Kubernetes:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

Verify pods:

```bash
kubectl get pods -o wide
kubectl get services
```

Evidence and cluster verification screenshots are available under `docs/`:
- Live Deployment: `docs/deployment.png`
- Kubernetes Pods: `docs/k8s-pods.png`
- Prometheus Scrape Targets: `docs/prometheus-targets.png`
