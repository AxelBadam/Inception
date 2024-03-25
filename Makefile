all:
	if ! grep -q "atuliara.42.fr" /etc/hosts; then \
		echo "127.0.0.1 atuliara.42.fr" >> /etc/hosts; \
	fi
	if ! grep -q "www.atuliara.42.fr" /etc/hosts; then \
		echo "127.0.0.1 www.atuliara.42.fr" >> /etc/hosts; \
	fi
	mkdir -p /home/atuliara/data/mariadb-data
	mkdir -p /home/atuliara/data/wordpress-data
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d
	
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v
	rm -rf /home/atuliara/data/mariadb-data
	rm -rf /home/atuliara/data/wordpress-data
fclean: clean
	sed -i '/atuliara\.42\.fr/d' /etc/hosts
	rm -rf /home/atuliara/data/mariadb-data
	rm -rf /home/atuliara/data/wordpress-data
	docker system prune -f

re: fclean all

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: all clean fclean re up down