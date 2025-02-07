FROM alpine:latest
RUN apk add --no-cache curl jq
WORKDIR /app
COPY fetchCommits.sh .
RUN chmod +x fetchCommits.sh
CMD ["sh", "fetchCommits.sh"]
