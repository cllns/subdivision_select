Subdivision Select
===

*subdivision_select* is a Rails plugin
that provides a new select form helper
automatically loads subdivisions (states/provinces) of a country
into a select box.
It works via AJAX,
but doesn't require you to write any javascript.

'subdivisions' are commonly known as 'states' or 'provinces'.
The terminology comes from [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2).
This data is provided by the `countries` gem,
via the `country_select` gem.


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
    <%= f.subdivision_select :subdivision %>
  </div>

  <%= f.submit %>
<% end %>

```

When you select a country,
the subdivisions of that country
will be automatically loaded into the subdivisions select via AJAX.

This plugin makes no assumptions about what you call the subdivision select,
so if you already named your column 'state' or 'province',
you can use that instead.
(The Javascript targets a class added via the subdivision_select helper)

Currently,
this plugin assumes your country column is named `country`,
and doesn't provide anyway to override that.
This is the next feature planned.

Installation
---
1. Add the following to your `Gemfile`:

```
gem "subdivision_select"
```


2. Add the following to your `config/routes.rb`:

```
 mount SubdivisionSelect::Engine, at: 'subdivisions'
```
(the 'subdivisions' part is necessary, since that path is hardcode in JS)


3. Add the following to `application.js` (or whatever your JS digest file is called)

```
//= require subdivision_select
```

License
---
MIT


Contributing
---
Please open a new Github Issue for any problems you have with the gem.
Bugs reports and feature requests are always welcome,
but I'm also willing to do tech support
or ways you think the code quality can be improved.
