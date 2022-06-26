
docker pull mysql/mysql-server:latest

docker run -p 3306:3306 --name=mysql-server -d mysql/mysql-server:latest

docker exec -it mysql-server mysql -uroot -p

m@L4R]om@nix9Ic3n1@wwUJISc0 // from container log

ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';  // from container

CREATE USER 'root'@'172.17.0.1' IDENTIFIED BY 'root';  // from host