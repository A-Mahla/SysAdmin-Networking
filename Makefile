.PHONY:	all

all :
		docker build -t router:latest -f Dockerfile.router ./p1
		docker build -t host:latest -f Dockerfile.host ./p1

fclean :
		docker rmi -f router:latest host:latest
