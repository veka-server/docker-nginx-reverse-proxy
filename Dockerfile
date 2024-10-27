# Utilise l'image officielle Nginx comme image de base
FROM nginx:alpine

# Copie le fichier de configuration nginx.conf dans le conteneur
COPY nginx.conf /etc/nginx/nginx.conf

# Copier le fichier index.html dans le dossier par défaut de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Expose le port 80 (ou 443 pour HTTPS)
EXPOSE 80

# Commande de démarrage Nginx
CMD ["nginx", "-g", "daemon off;"]
