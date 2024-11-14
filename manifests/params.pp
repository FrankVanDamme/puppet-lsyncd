class lsyncd::params {
  $config_dir  = '/etc/lsyncd'
  $settings = {}
  $max_user_watches = undef
  $service_name = 'lsyncd'
  $package_name = 'lsyncd'

  case ${facts[os][family]} {
    'Redhat': {
      $config_file = "/etc/lsyncd.conf"
    }
    'Debian': {
      case ${facts[os][name]} {
        'Ubuntu': {
          $config_file = "${config_dir}/lsyncd.conf.lua"
        }
        'Debian': {
          $config_file = "${config_dir}/lsyncd.conf.lua"
        }
        default: {
          fail("Unsupported platform: ${module_name} currently doesn't support ${facts[os][family]} or ${facts[os][name]}")
        }
      }
    }
    default: {
      fail("Unsupported platform: ${module_name} currently doesn't support ${facts[os][family]} or ${facts[os][name]}")
    }
  }
}
