# Use the official Ruby image as the base image
FROM ruby:3.3.2-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apk update
RUN apk add -y --no-cache nodejs build-base

# Copy Gemfile and Gemfile.lock to the working directory
COPY . .

# Install gems
RUN bundle config set --local path "vendor/bundle"
RUN bundle config without development
RUN bundle install --jobs 4 --retry 3

ENV RAILS_ENV=production 
ENV SECRET_KEY_BASE=thisNeedToChange 

# Copy the rest of the application code
RUN ./bin/rails db:migrate
RUN ./bin/rails assets:precompile
RUN rm -rf ./vendor/bundle/ruby/3.3.0/cache
RUN rm -rf ./tmp/cache

FROM ruby:3.3.2-alpine

RUN bundle config set --local path "vendor/bundle"
RUN bundle config without development

COPY --from=build /app /app/

WORKDIR /app

ENV RAILS_ENV=production 
ENV SECRET_KEY_BASE=thisNeedToChange 
# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-e", "production"]
