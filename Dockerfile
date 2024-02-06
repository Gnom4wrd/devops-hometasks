FROM golang:1.16 as build

RUN mkdir /wcg; \
    cd /wcg; \
    git clone https://github.com/Gnom4wrd/word-cloud-generator.git .; \
    make

FROM alpine:latest
RUN apk add bash libc6-compat
COPY --from=build /wcg/artifacts/linux/word-cloud-generator .
EXPOSE 8888

CMD /word-cloud-generator