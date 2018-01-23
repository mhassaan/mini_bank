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

  #### URL Request
  `POST http://localhost:3000/users/sign_up`

  #### Parameters
  Parameter | Presence | Description
  --- | --- | ---
  user[emai] | required | User email address.
  user[password] | required | User password.
  first_name | required | First name of the user.
  last_name | required | Last name of the user.

+ **Sign Up Using IRB:**

  Create user using IRB.

  #### Command
  `User.create(email:'johanas@mail.com',password:'12345678',first_name:'Johans',
    last_name:'Berg',address:'Park Lane', city:'NY', state:'NY',zip: '38100')`

  #### Parameters
  Parameter | Presence | Description
  --- | --- | ---
  user[emai] | required | User email address.
  user[password] | required | User password.
  first_name | required | First name of the user.
  last_name | required | Last name of the user.

+ **Create Bank Accounts:**
  Before setting up account for user we need to setup accounts for our bank.
  Set up bank accounts using IRB.
  By default balance is 0.0

  #### Command
  `Account.create(title:'Name of the account', balance: '')`

+ **Set Up User's Bank Accounts:**
  After creating bank accounts, now we can set up our user account.

  #### Command
  `require '/path_to_project_folder/app/services/account_service.rb'`
  `AccountService.set_up_account({account_id:1,user_id:4})`

  #### Parameters
  Parameter | Presence | Description
  --- | --- | ---
  user_id | required | Id of the newly created user.
  account_id | required | Id of any of the account created above.
