FROM node:18-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application code
COPY api.js swagger.js html_processor.js docx_converter.js ./
COPY public ./public

# Create tmp directory for file uploads
RUN mkdir -p tmp

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "api.js"]