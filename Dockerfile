FROM nginx
MAINTAINER madhava
LABEL This is for Job board site docker file
COPY . /usr/share/nginx/html
