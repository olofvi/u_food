[![Coverage Status](https://coveralls.io/repos/github/CraftAcademy/u_food/badge.svg?branch=develop)](https://coveralls.io/github/CraftAcademy/u_food?branch=develop)
[![Build Status](https://semaphoreci.com/api/v1/craftacademy/u_food/branches/develop/shields_badge.svg)](https://semaphoreci.com/craftacademy/u_food)
[![Heroku](http://heroku-badge.herokuapp.com/?app=ufoods-crypto&style=flat&svg=1)](https://ufoods.herokuapp.com/)
[![Heroku](https://heroku-badge.herokuapp.com/?app=ufoods)]
[![Heroku](http://heroku-badge.herokuapp.com/?app=ufoods-crypto&style=flat)]

# Ufoods app
August 2017 Craft Academy Course Project

An app which allows users to order food from various restaurants nearby.

## Website
https://ufoods.herokuapp.com/

## Using the site
#### As a customer:
Visit the [Ufoods site](https://ufoods.herokuapp.com/).
You will see restaurants nearby as markers on a map, and you may choose what range you want to search for restaurants in.
You can choose a restaurant category, then a restaurant, then a menu, and then you can view different dishes.
You sign up by creating an account with an email and password. After logging in you will be allowed to add dishes to order. On checkout you can choose delivery and pay with [Stripe](https://stripe.com/).

#### As a restaurant owner:
Visit the [admin login site](https://ufoods.herokuapp.com/admin/login). You can sign up and get your restaurant registered. Once you've done that you can add info, menus and dishes.

#### As a superadmin:
Visit the [admin login site](https://ufoods.herokuapp.com/admin/login). You can perform CRUD actions on all objects in the system. You are the one that registers Restaurant Owners and Restaurants.

## Getting Started
Change the current working directory to the location where you want the cloned directory to be made.

```
$ git clone https://github.com/CraftAcademy/ufoods
```

## Prerequisites
- ruby 2.4.0
- ruby rails 5.1.4

### Installing
Ensure that the gem versions on your local machine are as specified in the Gemfile.
Run bundle install to install dependencies.

## Running the tests
Run rake to see all the tests pass.  

### For acceptance test we use Cucumber.
It runs automated acceptance tests written in a behavior-driven development (BDD) style. Central to the Cucumber BDD approach is its plain language parser called Gherkin. It allows expected software behaviors to be specified in a logical language that customers can understand.  

Cucumber example:
```
Feature: user can see dishes and their info
  As a user
  In order to get food
  I would like to see a list of dishes and info about them

  Background:
    Given the following dishes exists
      | name           | description           | price  |  pic_url                |
      | Sushi rolls    | Tasty Japanese food   | 10     |  https://goo.gl/fH7P5F  |

  Scenario: user can view dish names
    Given I visit the dish page
    Then I should see the text "Sushi rolls"
    And I should see the text "Tasty Japanese food"
    And I should see the text "10"
    And I should see the picture "https://goo.gl/fH7P5F"
```
### For unit tests we use Rspec
It is a behavior-driven development (BDD) framework which is extensively used in the production applications. The basic idea behind this concept is that of Test Driven Development(TDD) where the tests are written first and the development is based on writing just enough code that will fulfill those tests followed by refactoring.  

Rspec example:
```
RSpec.describe Dish, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :price }
    it { is_expected.to have_db_column :pic_url }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :pic_url }
  end

  describe 'Factory' do
    it 'should be valid' do
      expect(FactoryGirl.create(:dish)).to be_valid
    end
  end
end
```


## Deployment
We automatically deploy this app with [Heroku](https://www.heroku.com/) through [Github](https://github.com/) and [Semaphore](https://semaphoreci.com/).

## Built With

#### Main Gems and Helpers
* [Rails](https://github.com/rails/rails)
* [Acts_as_a_shopping_cart](https://github.com/crowdint/acts_as_shopping_cart)
* [Gmaps.js](https://hpneo.github.io/gmaps/)
* [Active Admin](https://github.com/activeadmin/activeadmin)
* [CanCanCan](https://github.com/CanCanCommunity/cancancan)
* [Devise](https://github.com/plataformatec/devise)
* [Bootstrap-sass](https://github.com/twbs/bootstrap-sass)
* [Geocoder](https://github.com/alexreisner/geocoder)
* [Faker](https://github.com/stympy/faker)
* [Haml-rails](https://github.com/indirect/haml-rails)

#### Development Gems
* [Pry Byebug](https://github.com/deivid-rodriguez/pry-byebug)
* [Erd](https://github.com/amatsuda/erd)

#### Testing Gems
* [Rspec-rails](https://github.com/rspec/rspec-rails)
* [Shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [Factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)
* [Cucumber-rails](https://github.com/cucumber/cucumber-rails)
* [Coveralls](https://rubygems.org/gems/coveralls/versions/0.8.15)
* [Database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
* [Launchy](https://github.com/copiousfreetime/launchy)
* [Poltergeist](https://github.com/teampoltergeist/poltergeist)

## Authors
* [BasilMawejje](https://github.com/BasilMawejje)
* [Magnus-thor](https://github.com/magnus-thor)
* [NurlanEmir](https://github.com/nurlanemir)
* [Olofvi](https://github.com/olofvi)
* [Sajaas](https://github.com/Sajaas)

## License
MIT license

## Acknowledgments
The entire project is comprised of open source code so a huge **THANKS** to the open source community. 
Built with help from the coaches and some cool gems.
* [Tochman](https://github.com/tochman)
* [Diraoulo](https://github.com/diraulo)
* [Faraznaeem](https://github.com/faraznaeem)
* [Gustafr](https://github.com/gustafr)
