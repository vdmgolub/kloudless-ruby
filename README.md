# Kloudless

Kloudless API Ruby client.

## Installation

Add this line to your application's Gemfile:

    gem 'kloudless'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kloudless

## Usage

See the [Kloudless API Docs](https://developers.kloudless.com/docs) for the
official reference. You can obtain an API Key at the [Developer
Portal](https://developers.kloudless.com/).

```ruby
# Authentication
Kloudless.authorize(api_key: "abc")

accounts = Kloudless::Account.list
account = accounts.first

account = Kloudless::Account.update(account_id: account.id, active: false)
Kloudless::Account.delete(account_id: account.id)
```

## Version

This gem uses [semantic versioning](http://semver.org), where a version number
looks like:

```
v major.minor.patch
```

The major version tracks the version of the Kloudless API. For example, all
versions that start with `v0.x.y` are compatible with Kloudless API `v0`.

## Release

To release this gem, look under the `script` directory. Check out
[jch/release-scripts](https://github.com/jch/release-scripts) for details.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kloudless/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new [Pull Request](https://help.github.com/send-pull-requests/)

## Wishlist

- File#update not implemented
- Model attribute setters. e.g. f = File.new; f.name = '3'
- Object oriented style sugar interface: f = File.new; f.save (does create or update)
- associations between models. e.g. Account#files
- TravisCI
- README: examples, design, references
- rdoc/yard documentation
- move HTTP testing helpers to test_helper
- support more rubies 2.0? 1.9? jruby? using 2.1 kwargs
- what should #delete return? boolean, response
- better coverage in http tests
- Folder#retrieve should distinguish between subfolders and files
- webhooks?
- integration tests that can be run locally
- `find . -type f | xargs grep 'TODO'` for more
