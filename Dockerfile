# The base image to build the application on top of
FROM golang:1.15-alpine AS compileStage

# create a new directory for the build 
RUN mkdir /build

# change the working directory to /build to get the code and build it
WORKDIR /build

# Set env variables for go
# OS
ENV GOOS=linux
# GO Module
ENV GO111MODULE=on

ENV CGO_ENABLED=0

# Expose the port the application will run on
EXPOSE 8080

# copy the source code into the container
COPY . .

# Build the go application
RUN go build -o goviolin-main.o *.go

# Run the binary file
ENTRYPOINT [ "/build/goviolin-main.o" ]