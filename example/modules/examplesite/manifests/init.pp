class examplesite {

  include nginx

  file { '/var/www':
    ensure => directory,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0444',
  } ->
  file { '/var/www/example.net':
    ensure => directory,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0444',
  } ->
  file { '/var/www/example.net/index.html':
    ensure  => file,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0444',
    content => template('examplesite/index.html.erb'),
  } ->
  nginx::resource::vhost { 'example.net':
    ensure   => present,
    www_root => '/var/www/example.net',
  }
}
