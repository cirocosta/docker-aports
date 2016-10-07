IMAGE			:=	cirocosta/alpine-git

.PHONY: image run

image:
	docker build -t $(IMAGE) .

run:
	docker run -it --rm $(IMAGE) /bin/sh

