FROM nginx:1.13.5-alpine

## Copy our default nginx config
COPY ./nginx/default.conf  /etc/nginx/conf.d/default.conf

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
#COPY ./dist/ /usr/share/nginx/html/auth
COPY ./dist/ /usr/share/nginx/html/demo-angular-docker

EXPOSE 4200
CMD ["nginx", "-g", "daemon off;"]