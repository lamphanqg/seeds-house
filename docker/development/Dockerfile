FROM ruby:2.6.5
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

# Install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y vim build-essential postgresql-client

# Install nodejs and yarn
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn

RUN mkdir -p /root/.ssh && \
    ssh-keyscan github.com > /root/.ssh/known_hosts
COPY ./id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa && \
    eval `ssh-agent -s` && \
    ssh-add /root/.ssh/id_rsa
RUN git clone git@github.com:lamphanqg/seeds-house.git /seeds-house

WORKDIR /seeds-house

RUN bundle install

# Add a script to be executed every time the container starts.
RUN cp /seeds-house/entrypoint.sh /usr/bin/ && \
    chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
