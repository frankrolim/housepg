# Passo a passo

## Modelos

```bash
$ rails g model order_item movie:references quantity:integer cart:references order:references
$ rails g model order user:references
$ rails g model cart user:references
$ rails g migration AddPriceToMovies price:float
```

```ruby
# order_item.rb
class OrderItem < ApplicationRecord
  belongs_to :movie
  belongs_to :cart
  belongs_to :order
end

# cart.rb
class Cart < ApplicationRecord
  belongs_to :user
  has_many :order_itens
end

# order.rb
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
end

# movie.rb
class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :directors
  has_many :order_itens

  # ...
end

# user.rb
class User < ApplicationRecord
  require 'digest/md5'
  has_one :cart
  has_many :orders
end

# seeds.rb
Cart.create([{user: User.first},{user: User.last}])

10.times {OrderItem.create({quantity: (rand * 10).floor, movie: Movie.all.sample, cart: Cart.all.sample, order: nil})}

2.times {Order.create({user: User.all.sample})}

10.times {OrderItem.create({quantity: (rand * 10).floor, movie: Movie.all.sample, cart: nil, order: Order.all.sample})}
```

## Cart

### Controlador

```bash
$ rails g controller cart index
```

```ruby
# cart_controller.rb
class CartController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart = current_user.cart
  end
end

# routes.rb
resources :cart, only: [:index] do
  resources :movies, only: [:destroy,:update], controller: :cart
end

resources :movies do
  member do
    get 'add-to-cart'
  end
  collection do
    get 'search'
  end
end

# movies_controller.rb
# ...
def add_to_cart
  cart = current_user.cart
  order_item = cart.order_items.find_or_create_by({movie: @movie})
  order_item.increment!

  redirect_to cart_index_url, notice: "'#{@movie.title}' added to your cart."
end
```
