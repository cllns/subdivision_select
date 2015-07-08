Subdivision Select
===

**subdivision_select** is a Rails plugin that extends the functionality of the [**country_select**](https://github.com/stefanpenner/country_select) gem.

When you select a country,
a select box for the states or provinces (i.e. subdivisions) is automatically populated for that country.

It loads them via AJAX,
but this plugin doesn't require you to write any javascript.


Terminology
---
This plugin is called **subdivision_select** but it could have been called
*state_selct* or *province_select*

The terminology comes from [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2).

The data is provided by the `countries` gem.

Example
---
```
<% form_for(@address) do |f| %>
  <div class="field">
    <%= f.label :country %>
    <%= f.country_select :country %>
  </div>

  <div class="field">
    <%= f.label :subdivision, "State / Province" %>
    <%= f.subdivision_select :subdivision, @address.country %>
  </div>

  <%= f.submit %>
<% end %>

```

You can also use `subdivision_select_tag`,
if using
[FormTagHelpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html).

This plugin makes no assumptions about what you call the subdivision select,
so if you already named your column 'state' or 'province',
you can use that instead.

Currently,
this plugin assumes your country column is named `country`,
and doesn't provide anyway to override that.

Installation
---
1) Add the following to your `Gemfile`:

```
gem "subdivision_select"
```

2) Add the following to your `config/routes.rb`:

```
 mount SubdivisionSelect::Engine, at: 'subdivisions'
```
(the 'subdivisions' part is necessary, since that path is hardcoded in JS)


3) Add the following to `application.js` (or whatever your JS digest file is called)

```
//= require subdivision_select
```

Development and Testing
---
If you want to work on this gem, fork and clone the repo.
We use RSpec and Capybara.

There is a 'dummy app' in `spec/test_app` you can use for testing.

If you add a feature,
please add a feature spec for it,
using Capybara.

License
---
MIT


Contributing
---
Please open a new Github Issue for any problems you have with the gem.
Bugs reports and feature requests are always welcome,
but I'm also willing to do tech support
or take suggestions on ways you think the code quality can be improved.
