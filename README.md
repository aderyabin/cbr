# CBR

Ruby wrapper for The Central Bank of the Russian Federation API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cbr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cbr

## Usage

Reference currency codes

```ruby
CBR.catalog
```

Extract a quotation for a current day

```ruby
CBR.daily
```

Extract a quatation for a specific day:

```ruby
CBR.daily(Date.parse('12/12/2014'))
```

Extract currency for a specific day:

```ruby
CBR.daily(Date.parse('12/12/2014'))['usd']
```

Dynamic of quotations of the US dollar:

```ruby
CBR.dynamic('usd', Date.parse('01/12/2014'), Date.parse('12/12/2014'))
```


===
<p align="center"><a href="https://evilmartians.com/?utm_source=cbr">
<img src="https://evilmartians.com/badges/sponsored-by-evil-martians.svg" alt="Sponsored by Evil Martians" width="236" height="54">
</a></p>
