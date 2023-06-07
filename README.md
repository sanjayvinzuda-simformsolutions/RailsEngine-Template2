# RailsEngine-Template2

The "demo_rails_engine" is a Rails engine that provides additional functionality to the "online_selling_app" main application. It is designed to be mounted within the main application and extend its features.

## Installation

Started by creating rails engine
```ruby
rails plugin new demo_rails_engine --mountable
```
Add the "demo_rails_engine" gem to your main application's Gemfile:

```ruby
gem 'demo_rails_engine', path: './demo_rails_engine'
```
Then run the bundle command to install the gem:

```bash
$ bundle install
```

## Mounting the Engine

To mount the "demo_rails_engine" within your "online_selling_app" main application, add the following line to your main application's `config/routes.rb` file:

```ruby
mount DemoRailsEngine::Engine, at: '/rails_engine'
```

This will mount the engine at the '/rails_engine' URL path within your main application. Then will create CRUD for order table and implement order management for user's product.


## Implementing association and overriding with main app

Implementing associations with orders order.rb

```ruby
belongs_to :user, class_name: 'User'
belongs_to :product, class_name: 'Product'
```

Running the migration

```ruby
class AddUserAndProductToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :demo_rails_engine_orders, :user, foreign_key: { to_table: 'users' }
    add_reference :demo_rails_engine_orders, :product, foreign_key: { to_table: 'products' }
  end
end
```
Override the models

overrides/demo_rails_engine/order_override.rb

```ruby
DemoRailsEngine::Order.class_eval do
    def time_since_created
        Time.current - created_at
    end

    def product_name
        product.product_name
    end
end
```
