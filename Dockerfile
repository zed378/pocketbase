FROM alpine:latest

# Set the default value for the PB_VERSION variable
ARG PB_VERSION=latest

# Install necessary packages
RUN apk add --no-cache \
  unzip \
  ca-certificates 

# Set the environment variable with the fetched version (if applicable)
ENV PB_VERSION=$PB_VERSION

# Download and unzip PocketBase
# Replace the following URL with the correct download link for the desired version
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/ && \
  rm /tmp/pb.zip

# uncomment to copy the local pb_migrations dir into the image
# COPY ./pb_migrations /pb/pb_migrations

# uncomment to copy the local pb_hooks dir into the image
# COPY ./pb_hooks /pb/pb_hooks

# Expose the port
EXPOSE 8090

# Start PocketBase
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]