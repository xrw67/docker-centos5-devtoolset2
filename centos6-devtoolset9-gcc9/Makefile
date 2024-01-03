all:
	docker build -t centos6-devtoolset9-gcc9 .

push:
	docker tag centos6-devtoolset9-gcc9 xrw67/centos6-devtoolset9-gcc9
	docker push xrw67/centos6-devtoolset9-gcc9
run:
	docker run -it --rm  -v ${PWD}/imagefiles:/imagefiles/ centos6-devtoolset9-gcc9 /bin/bash