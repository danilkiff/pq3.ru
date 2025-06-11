# 1. Clone
FROM node:22-slim AS quartz

WORKDIR /quartz
RUN apt-get update && apt-get install -y git
RUN git clone --branch v4.5.1 --single-branch https://github.com/jackyzha0/quartz.git .
RUN npm install

# 2. Build
FROM node:22-slim
WORKDIR /app
COPY --from=quartz /quartz ./

COPY ./content/ ./content
COPY ./data/ ./data
COPY ./quartz.config.ts ./quartz.config.ts
COPY ./quartz.layout.ts ./quartz.layout.ts

EXPOSE 8080
CMD ["npm", "run", "dev"]
