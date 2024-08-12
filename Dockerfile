# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install xrdp and a lightweight desktop environment (like XFCE)
RUN apt-get update && \
    apt-get install -y xfce4 xfce4-goodies xrdp && \
    apt-get clean

# Configure xrdp to use XFCE
RUN echo "xfce4-session" > ~/.xsession

# Expose port 3389 for RDP
EXPOSE 3389

# Start xrdp
CMD ["/usr/sbin/xrdp", "-n"]
