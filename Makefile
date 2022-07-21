up:
	@echo "Iniciando container..."
	cd dev && docker compose up
container:
	@echo "Acessando container..."
	docker exec -it go_dev_with_vscode bash

down:
	@echo "Finalizando container..."
	cd dev && docker-compose down

logs:
	@echo "Acessando logs..."
	docker logs -f go_dev_with_vscode