FROM node:20-alpine

WORKDIR /app

COPY package.json ./
RUN npm install

COPY drizzle.config.ts ./

EXPOSE 4983

CMD ["npm", "run", "studio"]
