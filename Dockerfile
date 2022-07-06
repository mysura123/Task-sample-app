FROM node

#ENV NODE_ENV=DEV
#ENV DB_URL=mongodb://admin:password@localhost:27017

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "node", "server.js" ]



