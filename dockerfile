FROM node:20-alpine

# Устанавливаем все нужные пакеты
RUN apk add --no-cache ghostscript qpdf poppler-utils imagemagick

WORKDIR /app

RUN mkdir -p /tmp && chmod 777 /tmp

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

ENV PORT=3000
EXPOSE 3000

CMD ["node", "server.js"]
