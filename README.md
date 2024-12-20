# HexletCode

[![CI](https://github.com/Danpan13/rails-project-63/actions/workflows/ci.yml/badge.svg)](https://github.com/Danpan13/rails-project-63/actions/workflows/ci.yml)

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

## Usage

Here's how you can use the HexletCode gem to generate HTML forms:

```ruby
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new(name: 'rob', job: 'hexlet', gender: 'm')

form_html = HexletCode.form_for(user) do |f|
  f.input :name
  f.input :job, as: :text
end

puts form_html
# Output:
# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>
```

### Custom Attributes

You can also specify custom attributes for fields:

```ruby
form_html = HexletCode.form_for(user, url: '#') do |f|
  f.input :name, class: 'user-input'
  f.input :job, as: :text, rows: 50, cols: 50
end

puts form_html
# Output:
# <form action="#" method="post">
#   <input name="name" type="text" value="rob" class="user-input">
#   <textarea name="job" cols="50" rows="50">hexlet</textarea>
# </form>
```

### Error Handling

If you try to generate a field that doesn't exist in the entity, a `NoMethodError` will be raised:

```ruby
begin
  HexletCode.form_for(user) do |f|
    f.input :age
  end
rescue NoMethodError => e
  puts e.message
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).
