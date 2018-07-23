_build:
  # ...

export IMAGE
build: ## build images / see `make available_images` for a list of images
	@read -p "Enter image name: " IMAGE; $(MAKE) _build