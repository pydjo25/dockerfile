FROM golang:1.24.4

WORKDIR /app 

COPY go.mod go.sum tracker.db main.go parcel_test.go parcel.go ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /parcel_tracking_service

CMD ["/parcel_tracking_service"]