FROM mysql/mysql-server:8.0.32

WORKDIR /app

# Setup MySQL
COPY setup.sql ./

EXPOSE 3306
CMD ["bash"]
