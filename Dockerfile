FROM golang:1.17.6 as builder
ENV GO111MODULE=on

RUN apt-get update \
    && apt-get install -y upx \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
COPY go.mod /build
COPY go.sum /build
RUN go mod download

COPY . /build
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o="ktunnel" && \
    upx ktunnel

FROM scratch
WORKDIR /ktunnel
COPY --from=builder /build/ktunnel ./
EXPOSE 28688
CMD ["./ktunnel", "server"]
