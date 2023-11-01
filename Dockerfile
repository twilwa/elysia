FROM node:16-alpine

RUN npm i node-fetch

WORKDIR /app

COPY package.json .

RUN npm install --include=dev

COPY . .

RUN npm run build:esm && npm run build:cjs

RUN echo '{ "type": "commonjs" }' > package.json

EXPOSE 8080

CMD [ "node", "dist/cjs/index.js" ]