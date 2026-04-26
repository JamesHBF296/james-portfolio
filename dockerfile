FROM nginx:alpine

COPY james_hoh_portfolio.html /usr/share/nginx/html/index.html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]