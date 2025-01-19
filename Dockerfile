# Wybór podstawowego obrazu
FROM nginx:latest

# Usunięcie domyślnej konfiguracji Nginx
RUN rm -rf /usr/share/nginx/html/*

# Kopiowanie plików projektu do kontenera
COPY src/ /usr/share/nginx/html/

# Eksponowanie portu 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]