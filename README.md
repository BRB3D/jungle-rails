# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
Ruby project where we were asked to add features to an existing project.

In this case the pages added were:

- Admin Cateogries page
- Admin Dashboard
- Admin Sales
- Order Details page
- About Page
- Signup
- Login

Features that were added:

- Sold Out
- Creation of new categories by Admins
- User Authentication and signup
- Sales creation for admins.

Bug fixes:

- Added simple Admin security check
- Error message when empty car is created
- Fixed the way money was shown in orders and show.

Testing:

- Product page click on details takes us to show page of product
- Home page loads products
- Clicking on add to cart updates the cart in the NavBar



![About Page](https://github.com/BRB3D/jungle-rails/blob/master/public/images/About.png?raw=true)

![Details](https://github.com/BRB3D/jungle-rails/blob/master/public/images/Details.png?raw=true
)

![Empty Cart](https://github.com/BRB3D/jungle-rails/blob/master/public/images/Empty%20Cart.png?raw=true)


![Sale](https://github.com/BRB3D/jungle-rails/blob/master/public/images/Sale.png?raw=true
)
![Sold Out](https://github.com/BRB3D/jungle-rails/blob/master/public/images/Sold%20Out.png?raw=true
)
![New Category Admin](https://github.com/BRB3D/jungle-rails/blob/master/public/Gifs/New%20category.gif?raw=true)
![Login User](https://github.com/BRB3D/jungle-rails/blob/master/public/Gifs/login.gif?raw=true)
![Signup User](https://github.com/BRB3D/jungle-rails/blob/master/public/Gifs/signup.gif?raw=true)




## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
1. Remove Gemfile.lock
1. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe

## Testing

- Capybara
- Poltergeist
- Database Cleaner
