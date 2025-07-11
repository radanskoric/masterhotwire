FROM ruby:3.4

# Install all of the preqeusities to actually building the app.
RUN apt-get update \
  && apt-get install -y \
  vim \
  curl \
  cmake \
  && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt-get install -y nodejs\
  && npm install --global yarn\
  && rm -rf /var/lib/apt/lists/* \
  && gem install bundler -v 2.5.23

# Add some custom setup to the container shell for easier usage.
COPY .devcontainer/load-profile.sh /etc/profile.d/load-profile.sh
RUN chmod +x /etc/profile.d/load-profile.sh

# Do not work as a root user.
# If running on a host machine where Docker engine doesn't map the user from container
# to host, override this to match your own UID and GID, check with `id -u` and `id -g`, respectively.
# These are overridable Docker arguments that are then used to actually create the user and its group.
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

USER developer
WORKDIR /app

ENV PATH="$PATH:/home/developer/bin"

## The app setup

# Thise doesn't actually expose the ports, it's more of a documentation.
# It can be used when starting the docker container by using `-P` to auto expose all declared ports.
EXPOSE 4000

# Run the application when the container starts
CMD ["bin/bridgetown", "start"]
