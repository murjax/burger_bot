# BurgerBot

A simple Rails application for managing burger orders. Create custom burgers, manage toppings, and set prices.

### Features
- Build custom burgers.
- Add and manage burger ingredients.
- Set prices burger ingredients.
- Auto-price your burgers. Price of ingredients is used to calculate the total price of the burger.

### Requirements
- Ruby 3.2.1 (or greater)
- Postgres 14 (or greater)

### Local Setup
1. Clone project: `git@github.com:murjax/burger_bot.git`
2. Navigate into folder `cd burger_bot`
3. Install gems `bundle install`
4. Setup database `bundle exec rails db:create; bundle exec rails db:migrate`
5. Optional: Seed database with sample users and ingredients `bundle exec rails db:seed`
6. Start the server: `rails s`
7. Navigate to `http://localhost:3000`
8. Sign in or register.
9. You can now start using BurgerBot!

### Screenshots
![Imgur Image](https://imgur.com/29vrFup.jpg)
![Imgur Image](https://imgur.com/UUOZUcp.jpg)
![Imgur Image](https://imgur.com/52wyKgW.jpg)
