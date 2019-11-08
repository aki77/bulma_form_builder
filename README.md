# bulma_form_builder

`bulma_form_builder` is a Rails form builder that makes it super easy to integrate Bulma style forms into your Rails application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bulma_form_builder'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install bulma_form_builder
```

## Usage

To get started, use the `bulma_form_with` helper in place of the Rails `form_with` helper. Here's an example:

```erb
<%= bulma_form_with(model: @user, local: true) do |f| %>
  <%= f.email_field :email %>
  <%= f.password_field :password %>
  <%= f.check_box :remember_me %>
  <%= f.submit "Log In" %>
<% end %>
```

This generates the following HTML:

```html
<form action="/user" accept-charset="UTF-8" method="post">
  <div class="field">
    <label class="label" for="user_email">Email</label>
    <div class="control">
      <input class="input" type="email" name="user[email]" id="user_email" />
    </div>
  </div>
  <div class="field">
    <label class="label" for="user_password">Password</label>
    <div class="control">
      <input class="input" type="password" name="user[password]" id="user_password" />
    </div>
  </div>
  <div class="field">
    <label class="checkbox">
      <input name="user[remember_me]" type="hidden" value="0" />
      <input type="checkbox" value="1" name="user[remember_me]" id="user_remember_me" />
      <span class="control-label">Remember me</span>
    </label>
  </div>
  <input type="submit" name="commit" value="login" data-disable-with="login" />
</form>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aki77/bulma_form_builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
