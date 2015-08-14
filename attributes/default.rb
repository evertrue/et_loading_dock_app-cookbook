set['nginx']['default_site_enabled'] = false
set['nginx']['socketproxy']['default_app'] = 'loading-dock'
set['nginx']['socketproxy']['apps'] = {
  'loading-dock' => {
    'prepend_slash' => false,
    'context_name' => '',
    'subdir' => 'current',
    'socket' => {
      'type' => 'tcp',
      'port' => '9090'
    }
  }
}

set['reboot_coordinator']['reboot_permitted'] = false
