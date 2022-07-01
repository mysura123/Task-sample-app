FROM node:16

ENV MONGO_DB_USERNAME=username \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app



COPY package*.json ./ /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

COPY . .

EXPOSE 3000

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]
