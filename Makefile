.PHONY: install test build run docker-build docker-up

install:
	@echo "Project dependencies ready."

test:
	bash tests/test.sh

build:
	@echo "Application packaging complete."

run:
	@echo "Starting application locally..."
	docker compose up -d

# M5 Containerization targets
docker-build:
	docker build -t ghcr.io/skit-devops-2026/devops-24eskcs136:latest .

docker-up:
	docker compose up -d --build
