# Utilise l'image officielle Nginx comme image de base
FROM nginx:alpine

# Définir des arguments pour l'utilisateur et le mot de passe
ARG BASIC_USER
ARG BASIC_PASSWORD

# Copie le fichier de configuration nginx.conf dans le conteneur
COPY nginx.conf /etc/nginx/nginx.conf

# Génère le fichier .htpasswd au moment du build
RUN if [ -z "$BASIC_USER" ] || [ -z "$BASIC_PASSWORD" ]; then \
      echo "Error: BASIC_USER or BASIC_PASSWORD not set"; \
    else \
      echo "$BASIC_USER:$(openssl passwd -apr1 "$BASIC_PASSWORD")" > /etc/nginx/.htpasswd; \
    fi

# Copier le fichier index.html dans le dossier par défaut de Nginx
COPY index.html /usr/share/nginx/html/index.html

# Crée un répertoire pour stocker les certificats SSL
RUN mkdir -p /etc/nginx/ssl
    
# Expose le port 80 (ou 443 pour HTTPS)
EXPOSE 80 443

# Commande de démarrage Nginx
CMD ["nginx", "-g", "daemon off;"]
