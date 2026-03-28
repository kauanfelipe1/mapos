FROM php:7.4-apache

# 1. Instala dependências do sistema e extensões PHP
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    unzip \
    curl \
    && docker-php-ext-install mysqli pdo pdo_mysql

# 2. Instala o Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 3. Habilita o mod_rewrite do Apache
RUN a2enmod rewrite

# 4. Copia os arquivos do projeto
COPY . /var/www/html/

# 5. Define a pasta de trabalho e roda o Composer para instalar as bibliotecas
WORKDIR /var/www/html
RUN composer install --no-dev --optimize-autoloader

# 6. Ajusta permissões para o servidor web
RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80
