# Phase 4 On Duty

This is a simple Heroku-ready Sinatra application that uses the Trello API to figure out which Phase 4 students are "on duty" and displays them in a web page. The intent is that the Phase 1-3 students always know who to talk to when they need help.

The applicaiton needs a Trello API key and user token to work. To deploy, you'll need to [get your own key](https://trello.com/docs/gettingstarted/index.html#getting-an-application-key) and also [get a non-expiring token](https://trello.com/1/authorize?key=REPLACE_WITH_YOUR_KEY&expiration=never&response_type=token) (in that last link, be sure to replace the `REPLACE_WITH_YOUR_KEY` with your own Trello application key).

Once you've done so, you can set the Heroku environment variables as appropriate:

```bash
$ heroku config:set TRELLO_KEY=<YOUR_KEY> TRELLO_TOKEN=<YOUR_TOKEN>
```

Cheers!
