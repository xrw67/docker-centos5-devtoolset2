all:
	docker build -t xrw67/centos6-devtoolset9-gcc9 .

push:
	docker push xrw67/centos6-devtoolset9-gcc9
run:
	docker run -it --rm  -v ${PWD}/imagefiles:/imagefiles/ xrw67/centos6-devtoolset9-gcc9 /bin/bash