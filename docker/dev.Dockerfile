FROM golang:1.21-alpine AS builder

WORKDIR /app

# Install Air for live reloading
RUN go install github.com/air-verse/air@latest

# Copy go.mod and go.sum for better caching
COPY go.mod go.sum ./
RUN go mod download

# Copy the entire project (excluding files in .dockerignore)
COPY . .

# Expose application port
EXPOSE 8000

# Start application with Air for live reload
CMD [ "air" ]
