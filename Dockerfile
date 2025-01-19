# Wybór obrazu bazowego
FROM node:16 AS build

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików do obrazu
COPY package.json  ./
RUN npm install

# Kopiowanie całej aplikacji
COPY . .

# Budowanie aplikacji
RUN npm run build

# Wdrażanie za pomocą Nginx
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]