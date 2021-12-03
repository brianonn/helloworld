FROM scratch
CMD ["/helloworld"]


############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

WORKDIR /tmp

COPY . .

# Fetch dependencies.
# Using go get.
RUN go get -d -v

# Build the binary.
RUN go build -o /tmp/helloworld

############################
# STEP 2 build a small image
############################
FROM scratch
# Copy our static executable.
COPY --from=builder /tmp/helloworld /helloworld

# expose the port
EXPOSE 8080

# Run the hello binary.
ENTRYPOINT ["/helloworld"]
