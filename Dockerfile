FROM ruby:3.0.2

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update && apt install -y nodejs yarn
RUN mkdir /jojorion
WORKDIR /jojorion
COPY Gemfile /jojorion/Gemfile
COPY Gemfile.lock /jojorion/Gemfile.lock
RUN bundle install
COPY . /jojorion
