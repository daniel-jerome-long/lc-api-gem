# The Lifechurch.tv API Ruby Gem

A Ruby wrapper for the Lifechurch.tv REST API

## Installation
	gem install lc-api

## Quick Start Guide
First, register your application with LifeChurch.tv.

Then, copy and paste in your API Key.

```ruby
LcApi.key = "K690FKW924CKUCJTH94WK294WK029834SDFJ9862KSDF9234SDKF9421KDVDS"
```

Try finding a single resource:

```ruby
msg = LcApi::Message.find(1)
```

Try finding multiple resources:

```ruby
msg = LcApi::Message.all
```

Filter results:

```ruby
msg = LcApi::Message.find(1, :include => [:series, :speaker], :quantity => 20)
```

Access properties from the results:
```ruby
msg.title
msg.part
msg.length
msg.date_released
```

That's it, you're ready to rock!

## Configuration
You can configure both the API key and the base URI:

```ruby
LcApi.key = "K690FKW924CKUCJTH94WK294WK029834SDFJ9862KSDF9234SDKF9421KDVDS"
LcApi.base_uri = "http://0.0.0.0:3000/v1/"
```

## Usage Examples
All examples require an authenticated LifeChurch.tv consumer. See the <a href="#quick-start-guide">quick start</a> section above. 

**Get a message**

```ruby
LcApi::Message.find(1)
```

**Get all messages**

```ruby
LcApi::Message.all
```

**Get a message and include series and speakers**

```ruby
LcApi::Message.find(1, :include => [:series, :speaker])
```

**Get a message with includes and quantity**

```ruby
LcApi::Message.find(1, :include => [:series, :speaker], :quantity => 20)
```

**Get all messages with includes and quantity**
```ruby
LcApi::Message.all(:includes => [:series, :speaker], :quantity => 20)
```

**Access properties on a message**
```ruby
msg.title
msg.part
msg.length
msg.date_released
```

**Access properties on a set of messages**
```ruby
msg = LcApi::Message.all
msg.each do |m|
  msg.title
  msg.part
end
```

## Resources

* LcApi::Category
* LcApi::Location
* LcApi::Message
* LcApi::Series
* LcApi::Speaker
* LcApi::Staff

## Coming Soon
* Link to API homepage
* Documentation Like to API
* More details on optional params (:includes, :quantity, etc.)

## Copyright
Copyright (c) 2013 LifeChurch.tv.
See [LICENSE][] for details.

[license]: LICENSE.txt
