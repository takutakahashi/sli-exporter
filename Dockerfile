FROM ruby:2.7

WORKDIR /src
COPY Gemfile /src/
COPY Gemfile.lock /src/

RUN bundle install

COPY app.rb /src/
COPY scripts/ /src/scripts/

ENV PORT=9400
ENV HOST=0.0.0.0

CMD ["ruby", "app.rb"]
