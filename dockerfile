# Используем образ Node.js (Alpine для компактности)
FROM node:20-alpine

# Устанавливаем Ghostscript и qpdf (необходимы для работы)
RUN apk add --no-cache ghostscript qpdf

# Создаем рабочую директорию приложения
WORKDIR /app

# Создаем директорию для временных файлов и задаем права доступа
RUN mkdir -p /app/tmp && chmod 777 /app/tmp

# Копируем файлы зависимостей и устанавливаем их
COPY package*.json ./
RUN npm ci --omit=dev

# Копируем исходный код приложения
COPY . .

# Переменные окружения
ENV PORT=3000
ENV TMP_DIR=/app/tmp

# Открываем порт, который слушает приложение
EXPOSE 3000

# Запускаем приложение
CMD ["node", "server.js"]
