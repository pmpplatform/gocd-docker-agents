FROM gocd/gocd-agent-debian-11:v23.1.0

ENV DEBIAN_FRONTEND=noninteractive

USER root

# Base packages
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  curl \
  wget \
  gnupg \
  ca-certificates \
  make \
  lsb-base \
  lsb-release

# php repo
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  php8.2 \
  php8.2-cli \
  php8.2-common \
  php8.2-zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer