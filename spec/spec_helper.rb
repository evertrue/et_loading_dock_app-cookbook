require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.log_level = :fatal
end

# at_exit { ChefSpec::Coverage.report! }
