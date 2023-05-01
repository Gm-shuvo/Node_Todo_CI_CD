FROM node:12.2.0-alpine
# Define the working directory inside the container
WORKDIR /app
# Copy the file from your host to your current location.
COPY . /app
# Run the command inside your image filesystem.
RUN npm install
RUN npm run test
# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 8000
# Run the specified command within the container.
CMD ["node","app.js"]
