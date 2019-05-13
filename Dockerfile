from debian:stable
RUN apt update && apt install -y nginx apache2-utils
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
