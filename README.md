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

You can now see the project up and running locally at http://localhost:3000. Whoa! Thats fast ;)

+ **Sign Up:**

  One can create user either using console or using sign_up page.

  #### HTTP Request
  `POST http://localhost:3000/users/sign_up`

  #### Parameters
  Parameter | Presence | Description
  --- | --- | ---
  user[emai] | required | User email address.
  user[password] | required | User password.
  first_name | required | First name of the user.
  last_name | required | Last name of the user.
