# Use the official Ruby image as the base image
FROM ruby:3.3.2-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apk update
RUN apk add -y --no-cache nodejs build-base

RUN gem install bundler

# Copy Gemfile and Gemfile.lock to the working directory
COPY . .

# Install gems
RUN rm Gemfile.lock
RUN bundle config set --local path "vendor/bundle"
RUN bundle install --jobs 4 --retry 3

# Copy the rest of the application code
RUN ./bin/rails db:migrate
RUN ./bin/rails assets:precompile

FROM ruby:3.3.2-alpine

RUN bundle config set --local path "vendor/bundle"

COPY --from=build /app /app/

WORKDIR /app

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails server
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
