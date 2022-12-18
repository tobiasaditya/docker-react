#Build phase 

FROM node:16-alpine AS builder

USER node
 
RUN mkdir -p /home/node/app

WORKDIR /home/node/app
 
COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Run Phase

FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html
 #Default command already run nginx, no need to specify RUN command

