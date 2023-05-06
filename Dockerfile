FROM node:12.2.0-alpine AS builder
WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build

FROM node:12.2.0-alpine AS test
WORKDIR /app
COPY --from=builder /app /app
RUN npm run test

FROM node:12.2.0-alpine
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 8000
CMD ["node", "app.js"]
