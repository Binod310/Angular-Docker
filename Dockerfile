FROM node:latest as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=builder /app/dist/angular-docker-app /usr/share/nginx/html