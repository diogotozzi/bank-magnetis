# The Bank Project [🏦](https://gitlab.com/diogotozzi/bank/blob/master/Code_Challenge_-_Backend_-_Bank_Accounting__1_.pdf)

This is the Bank API Project. This repo is the API for the mobile app for Accounts and Transfers.

It's written in Ruby on Rails 5.2 + Postgresql 11.4. It also uses Docker.

## Starting the environments

> **Install:** Docker, Docker Compose 3.7 and [Postman](https://www.getpostman.com/downloads/)!

Run the following commands on your terminal:

- `git clone git@gitlab.com:diogotozzi/bank.git`
- `cd bank`
- `echo "SomeStrangeHashHere" > config/master.key`
- `docker-compose up -d`

Wait Docker download all images and run, then execute the following Rake command:

- `docker-compose run webserver rails db:setup`

This should connect to Postgres, create the databases, tables and populate then with some data.

And that is! You should be able to access the API at [http://localhost:3000](http://localhost:3000)

## Communicating with API

We have three API endpoints with our bank: `/api/ping`, `/api/account` and `/api/transfer`

> **Tip:** There is an [exported file](https://gitlab.com/diogotozzi/bank/blob/master/bank.postman_collection.json) with all the requests, ready to use in Postman 🙂

|                |POST                           |GET                          |
|----------------|-------------------------------|-----------------------------|
|Ping application|               |`/` or `/api/ping`                             |
|Create accaount |`/api/account`               |                             |
|Check account   |                 |`/api/account/:id`               |
|Transfer money  |`/api/transfer`   |                             |

## API Flow

### Ping application [GET]
Make a GET request to `/` or `/api/ping` to test if the framework is working

Then you should receive a JSON 200 response

### Create Account [POST]
Make a POST request to `/api/account` with the following parameters:

- account_id - integer
- name - string
- password - string

Then you should receive a JSON 200 response with the **token** for future authentications

### Access your account [GET]
Make a GET request to `/api/account/:id` with **token** in the header

Then you should receive a JSON 200 response with the *funds* in your account

### Transfer money [POST]
Make a POST request to `/api/transfer` with the following parameters:

- from_account_id - integer (your account number)
- to_account_id - integer (account you wish to transfer for)
- qty - doube (amount of money)
- password - string (your password)

Then you should receive a JSON 200 response with confirmation, *if you have funds*!

### Transfer money(deposit/add) [POST]
Make a POST request to `/api/transfer` with the following parameters if you wish to deposit/add money into your account:

- from_account_id - integer (your account number)
- to_account_id - integer (**your account number**)
- qty - doube (amount of money)
- password - string (your password)

Then you should receive a JSON 200 response with confirmation, *if you have funds*!

## Tests
To run all unit, functional and integration tests:

`docker-compose run webserver rails test -p`

## TODO

There is a bunch of things to do, feel free to send PR to us! 🙈

3. Run project in Kubernetes
4. Tune up Rails
5. Improve security
6. and more ...
