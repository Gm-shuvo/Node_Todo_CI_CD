FROM node:12.2.0-alpine AS builder
WORKDIR /app
COPY . /app
RUN npm install

FROM node:12.2.0-alpine AS test
WORKDIR /app
COPY --from=builder /app /app
RUN npm run test

FROM node:12.2.0-alpine AS prod
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 8000
CMD ["node", "app.js"]
