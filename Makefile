build:
	docker build . -t dacker
start:
	docker run -d -t -v /home/thehack/Documents/hacker:/home --restart unless-stopped --name dacker dacker
stop:
	docker stop dacker
attach: 
	docker exec -it dacker script -q -c "/bin/bash" /dev/null