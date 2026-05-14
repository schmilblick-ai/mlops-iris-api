links:
	@echo "Prometheus: http://localhost:9090"
	@echo "Grafana: http://localhost:3000"
	@echo "Makefile: https://www.gnu.org/software/make/manual/html_node/Overriding.html"

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

rerun:
	docker system df
	docker builder prune -f
	docker system df
	start-project