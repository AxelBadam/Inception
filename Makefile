all:
	mkdir -p /Users/atuliara/Desktop/mariadb-data
	mkdir -p /Users/atuliara/Desktop/wordpress-data
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d
	
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sed -i '/atuliara\.42\.fr/d' /etc/hosts
	rm -rf /Users/atuliara/Desktop/mariadb-data
	rm -rf /Users/atuliara/Desktop/wordpress-data
	docker system prune -f

re: fclean all

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up down