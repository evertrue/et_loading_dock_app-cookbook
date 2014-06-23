name             'et_loading_dock_app'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'All rights reserved'
description      'Installs/Configures et_loading_dock_app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'

depends 'et_rails_app', '~> 5.1.4'
depends 'apt'
