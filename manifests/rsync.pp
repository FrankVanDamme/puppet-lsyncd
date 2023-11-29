# For backwards compatibility
define lsyncd::rsync (
  $source   = undef,
  $target   = undef,
  $ensure   = present,
  $options  = {},
) {
  lsyncd::sync::rsync{$name:
    ensure  => $ensure,
    source  => $source,
    target  => $target,
    options => $options,
  }
}
