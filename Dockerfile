FROM node:14.19.3-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:stable-alpine

COPY nginx.conf  /etc/nginx/nginx.conf

COPY --from=builder /usr/src/app/dist/angular-starter usr/share/nginx/html

EXPOSE 80
