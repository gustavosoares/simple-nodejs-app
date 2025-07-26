FROM arm64v8/node:24-alpine

WORKDIR /app
ADD . /app

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]
