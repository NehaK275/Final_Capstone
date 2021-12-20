FROM node:14
ENV MONGODB_HOST=mongo
ENV MONGODB_DB=notesdb
ENV PORT=3000

LABEL author="neha.singh@knoldus.com"

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "run", "dev" ]