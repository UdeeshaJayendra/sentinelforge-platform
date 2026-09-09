FROM node:22.23.2-alpine3.24

WORKDIR /app

COPY package.json ./
COPY server.js ./

USER node

EXPOSE 8080

CMD ["node", "server.js"]