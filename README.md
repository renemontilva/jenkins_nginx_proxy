# Jenkins_nginx_proxy

It is a reverse proxy for jenkins servers which are in private networks and they can receive event from git provider's webhook.

## Configuration

### Create users for basic auth
The .htpasswd file can be created either from your local machine or from nginx docker 

### from local machine
```bash
htpasswd -c site/.htpasswd user1
```
### from docker machine
```bash
htpasswd -c /etc/nginx/site-available/.htpasswd user1
```

### Create SSL certificate

Create a private key and certificate in one command, from local machine

```bash
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/private/proxy.key -out ssl/certs/proxy.crt
sudo chown $USER:$USER ssl/certs/proxy.crt 
sudo chown $USER:$USER ssl/private/proxy.key
chmod 644 ssl/certs/proxy.crt
chmod 644 ssl/private/proxy.key
```

## Initialize dockers environment 

```bash
docker-compose build
docker-compose up
```

## Test it out
Now connect to your browser with the following url: https://localhost