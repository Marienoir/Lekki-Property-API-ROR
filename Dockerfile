FROM ruby:3.0.0-alpine

RUN apk add --update --virtual \
    runtime-deps \
    postgresql-client \
    nodejs \
    yarn \
    git \
    && rm -rf /var/cache/apk/*

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN bundle install
RUN yarn install

ENTRYPOINT ["bin/rails"]

CMD [ "s","-b","0.0.0.0" ]

EXPOSE 3000