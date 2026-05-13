# Etapa 1: Build (Construcción)
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
# Instalamos solo dependencias de producción para ahorrar espacio
RUN npm ci --only=production
COPY . .

# Etapa 2: Runtime (Imagen final ligera)
FROM node:20-alpine
WORKDIR /app
# Solo copiamos lo necesario de la etapa anterior
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/app.js ./
COPY --from=builder /app/server.js ./

EXPOSE 3000
CMD ["node", "server.js"]