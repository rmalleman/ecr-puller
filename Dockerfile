FROM docker:20.10.14-alpine3.15

WORKDIR /workdir


RUN apk add bash
RUN apk add --no-cache aws-cli

COPY login_and_pull.sh .

ENTRYPOINT /workdir/login_and_pull.sh




