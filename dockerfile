FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy source files
COPY . .

# Set fix for OpenSSL incompatibility
ENV NODE_OPTIONS=--openssl-legacy-provider

# Expose the development server port
EXPOSE 3000

# Start the development server
CMD ["yarn", "start"]
