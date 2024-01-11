all:
	docker build -t xrw67/debian12-gcc12 .

push:
	docker push xrw67/debian12-gcc12
run:
	docker run -it --rm  -v ${PWD}:/work/ xrw67/debian12-gcc12