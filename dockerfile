# Dockerfile – production image for Fly.io
# 1. Use small Alpine Node image
FROM node:20-alpine

# 2. Install Ghostscript & qpdf for PDF compression
RUN apk add --no-cache ghostscript qpdf

# 3. Create app directory
WORKDIR /app

# 4. Copy dependency manifests & install deps
COPY package*.json ./
RUN npm ci --omit=dev

# 5. Copy source code
COPY . .

# 6. Expose port & set env
ENV PORT=3000
EXPOSE 3000

# 7. Start server
CMD ["node", "server.js"]
