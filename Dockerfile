# Use the official Golang image as the base image
FROM golang:latest AS builder

# Set the working directory inside the container
WORKDIR /app

# Create a Go source file with the desired message
COPY . /app/

# Build the Go application
RUN go build -o main .

#Create second stage
FROM scratch

# Set the working directory inside the container
WORKDIR /app

# Copy the binary file from the builder stage
COPY --from=builder /app .

# Run the Go application when the container starts
CMD ["./main"]