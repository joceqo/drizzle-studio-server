FROM node:20-alpine

RUN apk add --no-cache nginx && \
    mkdir -p /var/log/nginx /run/nginx

WORKDIR /app

COPY package.json ./
RUN npm install

COPY drizzle.config.ts ./
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh ./
RUN chmod +x start.sh

EXPOSE 80

CMD ["./start.sh"]
