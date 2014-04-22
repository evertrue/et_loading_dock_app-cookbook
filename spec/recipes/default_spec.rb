require 'spec_helper'

describe 'et_loading_dock_app::default' do
  let(:chef_run) do
    ChefSpec::Runner.new do |node|
      # Create a new environment
      env = Chef::Environment.new
      env.name 'prod'

      # Stub the node to return this environment
      node.stub(:chef_environment).and_return(env.name)

      # Stub any calls to Environment.load to return this environment
      Chef::Environment.stub(:load).and_return(env)
    end.converge(described_recipe)
  end

  before do
    stub_data_bag_item('endpoints', 'rds').and_return(
      id: 'rds',
      prod: {
        default: {
          host: 'prod-etdb',
          schema_name: 'default'
        }
      }
    )

    Chef::EncryptedDataBagItem.stub(:load).with('secrets', 'database_credentials').and_return(
      'prod' => {
        'loading_dock' => {
          'username' => 'loading_dock',
          'password' => 'password'
        }
      }
    )

    Chef::EncryptedDataBagItem.stub(:load).with('secrets', 'aws_credentials').and_return(
      'RailsDeploy-prod' => {
        'access_key_id' => 'AAAAAAAAAAAAAAAAAAAA',
        'secret_access_key' => 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'
      }
    )
  end

  it 'includes et_rails_app' do
    expect(chef_run).to include_recipe('et_rails_app')
  end
end
