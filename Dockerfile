# Utilise l'image officielle Nginx comme image de base
FROM nginx:alpine

# Copie le fichier de configuration nginx.conf dans le conteneur
COPY nginx.conf /etc/nginx/nginx.conf

# Copier le fichier index.html dans le dossier par défaut de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Ajout d'une section pour la création du certificat auto-signé
RUN apk upgrade --update-cache --available && \
    mkdir /etc/nginx/ssl && \
    apk add openssl && \
    openssl req -x509 -newkey rsa:4096 -nodes -out /etc/nginx/ssl/nginx-selfsigned.crt -keyout /etc/nginx/ssl/nginx-selfsigned.key -subj "/C=US/ST=NY/L=New York/O=Acme Inc/CN=localhost"
    
# Expose le port 80 (ou 443 pour HTTPS)
EXPOSE 80

# Commande de démarrage Nginx
CMD ["nginx", "-g", "daemon off;"]
