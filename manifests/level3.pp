define lsyncd::level3 (
  $source   = undef,
  $target   = undef,
  $ensure   = present,
  $options  = {},
) {
  $path = "${lsyncd::config_dir}/sync.d/${name}.conf.lua"

  if $ensure == 'absent' {
    file { $path:
      ensure => $ensure,
      notify => Service['lsyncd'],
    }
  } else {
    file { $path:
      ensure  => $ensure,
      content => template("${module_name}/level3.conf.lua.erb"),
      mode    => '0644',
      require => File["${lsyncd::config_dir}/sync.d"],
      notify  => Service['lsyncd'],
    }
  }
}