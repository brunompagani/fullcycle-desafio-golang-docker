FROM golang:1.20 as buildimage

WORKDIR /usr/src/app

COPY . .
RUN go build -v -o /usr/local/bin/desafio-golang ./...

CMD ["desafio-golang"]

FROM scratch

COPY --from=buildimage /usr/local/bin/desafio-golang /
CMD ["/desafio-golang"]
