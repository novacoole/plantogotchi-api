# Plantogotochi
---

This is a team project created for the final assessment during the Coder Academy bootcamp. For this assessment we had one week for planning and less than two week to code. We had to create a React App with a Ruby on Rails backend.

Plantogotchi took inspiration from Tamagotchi giving users the ability to grow plants from a little seedling to a fully grown plant.

Netlify = https://plantogotchi.netlify.app

Rail Backend - https://github.com/novacoole/plantogotchi-api

Project Documentation - https://github.com/ping-n/T3A2-B

### Team Member
---

Ping Nge - https://github.com/ping-n

Alex Coole - https://github.com/novacoole

## Installation

1: Clone the this repository through git or download as a zip file

2: For the back-end repo, please run the following commands from the root folder of the repository through a cli of your choice.

3: This application require an installation of PostgreSQL to run which can download from the following -https://www.postgresql.org/download/

Run the following commands in the order listed below:

Install rails dependencies
```
bundle install
```
You will need to delete the credentials.yml.enc at the following path 'config/credentials.yml.enc'

After that you will need to generate a new master key so that knock generate jwt token for user authentication

4: Please run the following command to generate a new master key
```
EDITOR="code --wait" bin/rails credentials:edit
<!-- then exit out of the master.key file -->
<!-- if you receive file encrypted message in your terminal then you done it correctly  -->
```
5: Create a new database in PostgreSQL
```
rails db:create
```
6: Create the schema for database
```
rails db:migrate
```
7: Seed the database with different plants breed and test users
```
rails db:seed
```

or

Run the command below which is a combination of the commands above.
```
rails db:setup
```

8: Start the rails server
```
rails start
```

The back-end server will need to be running alongside the front-end server to enjoy the intended experience of Plantogotchi.
