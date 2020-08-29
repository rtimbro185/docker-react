# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# Run Stage with NGINX web server for Production Environment
FROM nginx
# copy only the compiled build folder content
COPY --from=builder /app/build /usr/share/nginx/html
