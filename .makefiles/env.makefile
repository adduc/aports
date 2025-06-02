.DEFAULT_GOAL := help

help: ## Show this help message
	@grep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-22s\033[0m %s\n", $$1, $$2}'

start: ## Start the build environment
	@echo "Starting the Docker containers..."
	@docker compose up -d

	@echo "Trusting abuild keys..."
	@docker compose exec build sh -c 'cp /root/.abuild/*.pub /etc/apk/keys/'

	@echo "Adding package repository..."
	@docker compose exec build sh -c 'echo /root/packages/src >> /etc/apk/repositories'

	@echo "Refreshing the APK index..."
	@docker compose exec build sh -c 'apk update'

shell: ## Open a shell in the build container
	@echo "Opening a shell in the build container..."
	@docker compose exec build sh

stop: ## Stop and remove the build environment
	@echo "Stopping and removing the Docker containers..."
	@docker compose down --remove-orphans --timeout 0

regenerate: ## Regenerate abuild keys
	@echo "Regenerating abuild keys..."
	@docker compose run build abuild-keygen -a -n
