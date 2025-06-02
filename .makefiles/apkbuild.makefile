build: ## Build this package
	@echo "Installing dependencies..."
	@docker compose exec -u user build sh -c '\
		cd /root/src/$(shell basename $$PWD) && \
		abuild deps \
	'

	@echo "Building..."
	@docker compose exec build sh -c '\
		cd /root/src/$(shell basename $$PWD) && \
		abuild -F \
	'
