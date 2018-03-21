# Lime

<p align="center">
  <a href="https://lime-lang.xyz/">
    <img src="https://github.com/lime-macro/lime-lang.xyz/blob/master/img/lime.png?raw=true" alt="" width=72 height=72>
  </a>

  <h3 align="center">Lime</h3>

  <p align="center">
    <a href="https://lime-lang.xyz/">Lime</a> is a tiny object-oriented macro programming language on <strong>Ruby/JVM/etc.</strong>
    <br>
    <a href="https://lime-lang.xyz/apis/"><strong>Explore Lime API docs »</strong></a>
    <br>
    <br>
      <a href="https://travis-ci.org/lime-macro/lime/">
        <img src="https://img.shields.io/travis/lime-macro/lime.svg?style=flat-square" alt="travis">
      </a>
    ·
      <a href="https://rubygems.org/gems/limem/">
        <img src="https://img.shields.io/gem/v/limem.svg?style=flat-square" alt="rubygems">
      </a>
    ·
      <a href="https://gitter.im/lime-macro/lime">
        <img src="https://img.shields.io/gitter/room/lime-macro/lime.svg?style=flat-square" alt="chat-on-gitter">
      </a>
    ·
      <a href="https://beta.gemnasium.com/projects/github.com/lime-macro/lime">
        <img src="https://img.shields.io/gemnasium/lime-macro/lime.svg?style=flat-square" alt="dependencies">
      </a>
    ·
      <a href="https://codecov.io/gh/lime-macro/lime">
        <img src="https://img.shields.io/codecov/c/github/lime-macro/lime.svg?style=flat-square" alt="coverage">
      </a>
    ·
      <a href="https://www.gnu.org/licenses/agpl-3.0.html">
        <img src="https://img.shields.io/github/license/lime-macro/lime.svg?style=flat-square" alt="license">
      </a>
    ·
      <a href="https://github.com/lime-macro/lime/pulse">
        <img src="https://img.shields.io/github/languages/code-size/lime-macro/lime.svg?style=flat-square" alt="codesize">
      </a>
  </p>
</p>

> This repository contains code of Ruby lime interpreter implementation

## What does Lime looks like?

__It looks like this:__

```scheme
(class std::String
  (def a_monkey?
    self.start_with 'm))
(p ("mastermm".a_monkey?))
```

```scheme
(print 'Hello 'World '\n)
(puts "Hello world")

('(.. 1 10).each' (do (i)
  (puts i)))

(def fold (ls init op)
  (ls.each (do (index-var)
    ([]= LENV index-var (op init index-var)))))

(fold ("  a b c) 0 (do (init name)
  (case name
    ('a 1)
    ('b "str")
    ('c #h))))

((# (a b c) (+ a (+ b c))) 1 2 3) ;=> 4
```

```scheme
(module Animal
  (class Duck
    (attr name)
    (initialize (name) (self.name= name))
    (def sleeping self::sleeping)
    (def sleep (self::sleeping= #t))))

(class std::Object
  (def duck? (self.is_a? Duck)))

(-> duck (Duck.new 'Donald))

('(" name sleep sleeping).each' (do (mid)
  (duck.send mid)))

('(" quack walk)'.each (do (mid)
  (duck.define_method mid (do (puts "#{mid}ing...")))))

(duck.quack)
(duck.walk)
(Duck.define_method :is_a_duck??? (do #t))
(-> swissie (Duck.new 'Swissie))
(swissie.is_a_duck???)
```

```scheme
(def dangerous_method
  (raise "lime f**king comming"))
(begin
  (dangerous_method)
  (rescue RuntimeError (do (e)
    (puts '(run away)')))
  (ensure (exit)))
```

```scheme
(def ^# (args=() body)
  (. macro args body))

(# (puts))

(class std::Number
  (def add (other)
    (args.other.+ self)))

(-> += (# (var val)
  (~> args.^.var (+ var val))))

(def ^print_really (*args) (print args))
(print_really hello, world!!!!) ;-> hello, world!!!
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'limem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install limem

## Usage

__Quick start:__

```ruby
require 'limem/engine'
engine = Limem::Engine.new
engine.macro(:fortune) do |body, saying|
  puts "#{body}: #{saying}"
end
engine[:picasso] = { name: 'Picasso', saying: '(......wtf???)' }
engine.eval '(fortune picasso::name picasso::saying)'
```

More information see [wiki](https://github.com/lime-macro/lime/wiki)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lime-macro/lime. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [AGPL-3.0 License](LICENSE).

## Code of Conduct

Everyone interacting in the Lime project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lime-macro/lime/blob/master/CODE_OF_CONDUCT.md).
