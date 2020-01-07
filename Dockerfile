# For Build
FROM node:alpine as builder 
WORKDIR /app
# Update Base Image
COPY ./package.json ./
RUN npm install 
COPY . .
RUN npm run build

# For Run
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

