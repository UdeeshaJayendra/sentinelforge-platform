FROM node:22.23.2-bookworm-slim

WORKDIR /app

COPY package.json ./
COPY server.js ./

# The application only needs the Node.js runtime.
# Remove package managers from the runtime image to reduce attack surface.
RUN rm -rf /usr/local/lib/node_modules/npm \
           /usr/local/lib/node_modules/corepack \
           /opt/yarn* \
           /usr/local/bin/npm \
           /usr/local/bin/npx \
           /usr/local/bin/corepack \
           /usr/local/bin/yarn \
           /usr/local/bin/yarnpkg

USER node

EXPOSE 8080

CMD ["node", "server.js"]