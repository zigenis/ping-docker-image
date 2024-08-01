# Use an official Alpine image as a parent image
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache iputils coreutils

# Create a directory for logs
RUN mkdir /logs

# Copy the ping script to the container
COPY ping.sh /ping.sh

# Grant execution rights on the script
RUN chmod +x /ping.sh

# Command to run the script
CMD ["/ping.sh"]