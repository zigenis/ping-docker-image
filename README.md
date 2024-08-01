### Do you need to continuously ping 1.1.1.1 every 4 seconds to collect data on how your ISP is refusing to fix a problem only they can?

Well, boy do I have a tool for you.

### Installation

1. Run `docker build . -t internet-checker:latest`
2. Use the image however you see fit (docker-compose example below). Be sure to mount /logs directory.
3. Review CSV in /logs directory.
4. Call your ISP.
5. Never get anywhere.
6. Begin again from step 4 ad infinitum.

### docker-compose example
```
version: '3'

services:
  internet-check:
    container_name: "internet-check"
    image: internet-check:latest
    restart: unless-stopped
    volumes:
      - "/docker-mounts/internet-check:/logs"
```