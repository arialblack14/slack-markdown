# README

I tried to use markdown on Slack.
Well guess what!?

It does not support it (they say so in their help page after all).

But this repo can easily be used for creating a Slack app.

First, you have to create an app on the Slack apps page.
You can expose your localhost with either the `localtunnel` gem or `ngrok`.
Although, I have use localtunnel before I tried ngrok and found it super-easy to setup.

Instal the app in a workplace of yours.

Then, run `bundle exec sidekiq`.
And run `rails s`
