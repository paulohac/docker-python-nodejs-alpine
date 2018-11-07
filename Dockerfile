FROM keymetrics/pm2:8-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup && \
    apk add --no-cache python3 && \
    mkdir -p /home/appuser/app

WORKDIR /home/appuser/app

COPY . /home/appuser/app

RUN chown -R appuser:appgroup /home/appuser/app && chmod 755 -R /home/appuser/app

USER appuser

RUN npm install

CMD ["npm","start"]
