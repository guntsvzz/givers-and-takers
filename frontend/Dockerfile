FROM node:alpine

# Install Angular CLI globally
RUN npm install -g @angular/cli@17

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Remove node_modules and package-lock.json, clear npm cache to fix issues
RUN rm -rf node_modules package-lock.json
RUN npm cache clean --force

# Install project dependencies
RUN npm install

# Copy the entire Angular project to the working directory
COPY . .

# Expose the port Angular will run on (default is 4200)
EXPOSE 4200

# Run Angular development server
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
