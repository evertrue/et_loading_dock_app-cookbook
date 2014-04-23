# et_loading_dock_app cookbook

Simple cookbook to set up [evertrue/loading-dock](https://github.com/evertrue/loading-dock).

While that’s not a Rails app, it’s a Sinatra app, and has all the same base
requirements from an instance.

# Requirements

* [et_rails_app-cookbook](https://github.com/evertrue/et_rails_app-cookbook)

# Usage

Include the `et_loading_dock_app::default` recipe in your run list.

# Attributes

Overrides a few defaults from the `et_rails_app` cookbook:

* `node['nginx']['default_site_enabled']`
* `node['nginx']['socketproxy']['default_app']`
* `node['nginx']['socketproxy']['apps']`

Also sets a few attributes used by the `node` cookbook:

* `['node']['revision']`
* `['node']['packages']`

# Recipes

## default

1. Installs & sets up Node.js & its dependencies
2. Includes `et_rails_app::default`

# Author

Author:: EverTrue, Inc. (<devops@evertrue.com>)
