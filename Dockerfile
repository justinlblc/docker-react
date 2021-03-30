FROM node:alpine 

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80               #In a dev env: this container needs a port map to 80, for beanstalk
COPY --from=0 /app/build /usr/share/nginx/html