#stage1

FROM node:alpine AS builder 
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . . 
RUN npm run build

#stage2
FROM nginx:latest 
COPY --from=builder /app/dist/sampleangular /usr/share/nginx/html 
EXPOSE 80
CMD ["nginx","-g","daemon off;"]