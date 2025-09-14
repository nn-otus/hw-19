# Базовый образ
FROM alpine:latest

# Установка nginx
RUN apk update && apk add --no-cache nginx

# Создание рабочей директории
RUN mkdir -p /run/nginx /usr/share/nginx/html

# Копируем свою страницу вместо дефолтной
COPY index.html /usr/share/nginx/html/index.html

# Копируем конфигурационный файл
COPY nginx.conf /etc/nginx/nginx.conf

# Открываем 80 порт
EXPOSE 80

# Запускаем nginx в foreground
CMD ["nginx", "-g", "daemon off;"]

