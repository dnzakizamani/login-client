# Deployment to VPS

## Prerequisites

- Docker and Docker Compose installed on your VPS
- Domain `dash.dnzaki.my.id` pointing to your VPS IP address
- Caddy will automatically handle SSL certificate generation

## Deployment Steps

1. Clone your repository to the VPS:
   ```bash
   git clone <your-repo-url>
   cd login-client
   ```

2. Make sure your domain is properly configured in the Caddyfile:
   ```
   dash.dnzaki.my.id {
       encode zstd gzip
       reverse_proxy app:80
   }
   ```

3. Make the deploy script executable:
   ```bash
   chmod +x deploy.sh
   ```

4. Run the deployment:
   ```bash
   ./deploy.sh
   ```

Alternatively, you can run the commands manually:
```bash
docker-compose build
docker-compose up -d
```

## Configuration Notes

- The application uses nginx inside the container to handle SPA routing
- Caddy handles SSL termination and reverse proxy
- All non-static requests are routed to index.html to support React Router
- The application will be available at https://dash.dnzaki.my.id

## Troubleshooting

- Check container logs: `docker-compose logs -f`
- If SSL certificate generation fails, check that your domain points to the correct IP address
- Verify that ports 80 and 443 are not blocked by firewall