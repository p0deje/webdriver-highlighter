# webdriver-highlighter

Automatically highlights element (changes it background color for a moment) before you click it or change its value.

## Installation

Add this line to your application's Gemfile:

```bash
gem 'webdriver-highlighter'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install webdriver-highlighter
```

## Usage

Just pass instance of `WebDriverHighlighter` as `:listener` option for WebDriver instantiation.

With Selenium-WebDriver:

```ruby
require 'webdriver-highlighter'
Selenium::WebDriver.for(:firefox, listener: WebDriverHighlighter.new)
```

With Watir-WebDriver:

```ruby
require 'webdriver-highlighter'
Watir::Browser.new(:firefox, listener: WebDriverHighlighter.new)
```

With Capybara (not tested actually):

```ruby
require 'webdriver-highlighter'
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox, listener: WebDriverHighlighter.new)
end
```

## Contributing

1. Fork it ( http://github.com/p0deje/webdriver-highlighter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
