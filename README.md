# PH challenge

## What is the project about?

This is a code challenge for PH.

## What technologies does the project use?

Postgres, Node.js, Express.js, Body-Parser, PG, NPM, Bower, HTML5, CSS3, AngularJS, and Bootstrap.

## Download and install:

*If you don't have NPM yet, from terminal:*

`curl https://npmjs.org/install.sh | sh`

In your browser, navigate to [the repo] (https://github.com/ldmcdaniel/challenge).

In the top-right corner of the page, click Fork and choose the account you want to for to.  Copy the [url of the forked repo] and insert it in the next step.

In your designated code directory, type:

```sh
git clone [url of the forked repo]
cd challenge
npm install
bower install
```

Install [Postgres.app] (https://github.com/PostgresApp/PostgresApp/releases/download/9.4.5.0/Postgres-9.4.5.0.zip).
1. Download
1. Move to /Applications
1. Double Click

With Postgres installed and running, follow [these commands] (http://postgresapp.com/documentation/cli-tools.html) to use the command line tools included with Postgres.

From the 'challenge' directory that you forked, type the following in terminal:

```sh
psql --command="create database premise"
psql -d premise -f premise.sql
```

From the 'challenge' root directory, type:

`node app.js`

Open your web browser to [this address] (http://localhost:4000/) and you will see the app.
