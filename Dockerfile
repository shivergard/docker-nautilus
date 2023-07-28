FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    nautilus \
    mousepad \
    dbus-x11 \
    libgtk-3-0 \
    libcanberra-gtk-module \
    libcanberra-gtk3-module \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a new user (optional but recommended)
RUN useradd -ms /bin/bash nautilususer
USER nautilususer
WORKDIR /home/nautilususer

# Start Nautilus upon container run
CMD ["nautilus"]