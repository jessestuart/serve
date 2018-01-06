FROM node:8-alpine
LABEL maintainer="Jesse Stuart <hi@jessestuart.com>"

WORKDIR /app/serve

ADD package.json .
ADD package-lock.json .
RUN npm install --quiet --no-progress --production
COPY . /app/serve
RUN chmod +rx ./scripts/node-prune.sh && ./scripts/node-prune.sh

ENTRYPOINT ["./bin/serve.js"]
