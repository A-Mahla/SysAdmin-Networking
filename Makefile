.PHONY:	all

all :
		docker build -t router:latest -f Dockerfile.router .
		docker build -t host:latest -f Dockerfile.host .
