# hash_order_helper

Add methods to manipulate the order of the entries in the Hash object.

[![Build Status](https://travis-ci.org/winebarrel/hash_order_helper.svg?branch=master)](https://travis-ci.org/winebarrel/hash_order_helper)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hash_order_helper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hash_order_helper

## Usage

```ruby
require 'hash_order_helper'

hash = {b: 200, a: 100, c: 150}

hash.sort_pair
#=> {:a=>100, :b=>200, :c=>150}

hash.unshift(d: 300)
#=> {:d=>300, :b=>200, :a=>100, :c=>150}
```

The following methods are added:

* `sort_pair -> Hash`
* `sort_pair! -> Hash`
* `sort_pair_by {|key, value| ... } -> Hash`
* `sort_pair_by! {|key, value| ... } -> Hash`
* `at(nth) -> Array`
* `insert(nth, hash) -> Hash`
* `last -> Array`
* `last(n) -> Array`
* `pop -> Array`
* `pop(n) -> Array`
* `nd_push(hash) -> Hash` **non-destructive** (alias: `+`)
* `push(hash) -> Hash` (alias: `<<`)
* `nd_unshift(hash) -> Hash` **non-destructive**
* `unshift(hash) -> Hash`
* `>>(receiver_hash) -> Hash`

### `>>` method

```ruby
require 'hash_order_helper'

hash = {b: 200, a: 100, c: 150}

{d: 300} >> hash
#=> {:d=>300, :b=>200, :a=>100, :c=>150}
```
