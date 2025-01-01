# Master Hotwire website

This repository contains the source code for the [Master Hotwire book website](https://masterhotwire.com/).

It's built with Bridgetown.

## Prerequisites

The project is set up with a Devcontainer so only a Docker Runtime is needed.

For example, Colima: https://github.com/abiosoft/colima

## Development

The intended development environment is a dev container.
Make sure that you have the following defined in a .env file
in root folder:
```
COMPOSE_FILE=.devcontainer/docker-compose.yml
```

Then the project can be run in a dev container with: `docker-compose up`.

Once it starts navigate to [localhost:4000](https://localhost:4000/)!

### Paddle integration

The docker-compose is set up by default with the sandbox account owned by me (Radan).

If you need a new account create it at [sandbox-vendors.paddle.com](https://sandbox-vendors.paddle.com).

#### Paddle API

To be able to use Paddle API in general and `bin/bridgetown paddle:sync` custom task, you
need to set the paddle API key. It's not committed to the repository, instead add it
to `.env` file under `PADDLE_API_KEY` variable.

#### Testing checkout flow

To test the full checkout flow while developing locally you'll need
to expose the app to the world with ngrok (make sure to have it installed).

1. Start ngrok: `ngrok http 4000`.
2. Take the new ngrok endpoint and create a webhook in a paddle sandbox account (events: `customer.created`, `transaction.paid`).
3. Add the webhook secret to the `.env` file under `PADDLE_WEBHOOK_SECRET_KEY` variable.
  This can be found in paddle Notifications UI, when editing a Webhook
  ([sandbox link](https://sandbox-vendors.paddle.com/notifications-v2).

### Commands

Examples of some bridgetown commands.
Prefix them with `docker-compose run app` to run inside the devcontainer.

```sh
# running locally
bin/bridgetown start

# build & deploy to production
bin/bridgetown deploy

# load the site up within a Ruby console (IRB)
bin/bridgetown console
```

> Learn more: [Bridgetown CLI Documentation](https://www.bridgetownrb.com/docs/command-line-usage)

## Deployment

The project is currently being deployed on Github pages (primary deployment)
and on Fly.io (secondary deployment for the API).

