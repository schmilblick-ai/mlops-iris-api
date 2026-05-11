links:
	@echo "Prometheus: http://localhost:9090"
	@echo "Grafana: http://localhost:3000"

#docker image and instance for the uvicorn backend server
build-api:
	docker build -t mlops-iris-api -f ./src/api/Dockerfile .

run-api:
	docker run --rm -d --name iris-api -p 8000:8000 mlops-iris-api

stop-api:
	docker stop iris-api

#docker image for nginx proxy server
start-project:
	docker compose -p mlops up -d --build

log-project:
	docker compose -p mlops logs
	
stop-project:
	docker compose -p mlops down
