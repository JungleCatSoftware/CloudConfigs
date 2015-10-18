class examplesite {
  include nginx
  nginx::resource::vhost { 'example.net':
    ensure   => present,
    www_root => '/var/www/example.net',
  }
  file { '/var/www/example.net/index.html':
    ensure  => file,
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0444',
    content => template('examplesite/index.html.erb'),
    require => Nginx::Resource::Vhost['example.net'],
  }
}
