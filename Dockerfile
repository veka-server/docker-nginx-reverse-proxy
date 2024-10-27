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
    openssl req -x509 -newkey rsa:2048 -nodes -sha256 -out /etc/nginx/ssl/nginx-selfsigned.crt -keyout /etc/nginx/ssl/nginx-selfsigned.key -subj '/CN=server1.local' -extensions EXT -config <( \
   printf "[dn]\nCN=server1.local\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:server1.local\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")
    
# Expose le port 80 (ou 443 pour HTTPS)
EXPOSE 80

# Commande de démarrage Nginx
CMD ["nginx", "-g", "daemon off;"]
