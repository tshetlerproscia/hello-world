# Use a small Go base image
FROM golang:1.23-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files first for better caching
COPY src/go.mod ./
RUN go mod download

# Copy the source code
COPY src/main.go .

# Build the Go application
RUN go build -o server .

# Expose the application's port
EXPOSE 8080

# Command to run the application
CMD ["./server"]
