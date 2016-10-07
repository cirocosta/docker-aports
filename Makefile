IMAGE			:=	cirocosta/alpine-git

.PHONY: image

image:
	docker build -t $(IMAGE) .

