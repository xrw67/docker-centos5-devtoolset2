all:
	docker build -t centos6-devtoolset9-gcc9 .

push:
	docker tag centos6-devtoolset9-gcc9 xrw67/centos6-devtoolset9-gcc9:$(shell date +%Y%m%d)
	docker push xrw67/centos6-devtoolset9-gcc9:$(shell date +%Y%m%d)
run:
	docker run -it --rm  -v ${PWD}/imagefiles:/imagefiles/ centos6-devtoolset9-gcc9 /bin/bash