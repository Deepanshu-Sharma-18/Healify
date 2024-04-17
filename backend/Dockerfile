FROM golang:1.20 as build
 
WORKDIR /workspace
 
COPY go.mod go.sum ./
RUN go mod download
 
RUN go run github.com/steebchen/prisma-client-go prefetch
 
COPY . ./
COPY .env ./

ENV $(cat .env)
 
RUN go run github.com/steebchen/prisma-client-go generate
 
RUN go build -o /app .



EXPOSE 3000

CMD ["/app"]