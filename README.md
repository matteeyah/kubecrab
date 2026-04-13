# KubeCrab

Rails app for user friendly Kubernetes deployment.

## Features
- **Marketplace** - Users can deploy their crabs with a simple click
- **Templates** - Admins define crab template which will become available in the marketplace
- **Engines** - The templates are executed with an engine current engine supported is Kubernetes
- **Custom Engines** - Add your own custom engine i.e. docker, terraform etc.

## Quickstart

### Build image
Build the container:
```ruby
$ docker build -t kubecrab .
```

### Export environment variable
Before running docker-compose make sure to generate a secret key base:
```ruby
$ docker run -ti kubecrab bin/rails secret
```

Export SECRET_KEY_BASE environment variable with the secret:
```ruby
$ export SECRET_KEY_BASE=4abcb02f4cf2bf...
```

### Run docker compose
```ruby
$ docker compose up
```

## Recommendations
When all access to the app is happening through a SSL-terminating reverse proxy make sure to set environment variable ```RAILS_SSL=true```
