FROM php:7.4-apache

# Instala extensões necessárias para o MapOS
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql

# Habilita o mod_rewrite do Apache (essencial para as rotas do CodeIgniter)
RUN a2enmod rewrite

# Copia os arquivos do projeto para o servidor
COPY . /var/www/html/

# Ajusta permissões
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80
