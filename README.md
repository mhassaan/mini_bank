# README
This documentation intends to give an overview of the flow of the program.

Getting started with mini_bank
--------------------------------

### Prerequisites

You are going to need:

- **Linux or OSX**
- **Ruby version-2.4.0**
- **Rails version-5.0**
- **Bundler** - If Ruby is installed but the `bundle` command does not work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Fork this repository on Github.
2. Clone the forked repository to your hard drive using `git clone git@github.com:YOUR USERNAME/mini_bank.git`
3. `cd mini_bank`

```shell
bundle install
rake db:create
rake db:migrate
rails s
```

You can now see the apis up and running locally at http://localhost:3000. Whoa! Thats fast ;)
