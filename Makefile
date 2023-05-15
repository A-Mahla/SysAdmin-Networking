NAME := badass

all:	$(NAME)

$(NAME) :
		docker build -t router:latest -f Dockerfile.router .
		docker build -t host:latest -f Dockerfile.host .
