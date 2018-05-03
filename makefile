
all: mapperproxy

mapperproxy-mume:
	git clone https://github.com/nstockton/mapperproxy-mume.git

mapperproxy: mapperproxy-mume
	ln -s mapperproxy-mume mapperproxy
