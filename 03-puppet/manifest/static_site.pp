class static_site {
  package { 'httpd':
    ensure => installed,
  }
  file { '/etc/httpd/conf.d/static_site.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('static_site/static_site.conf.erb'),
    require => Package['httpd'],
    notify  => Service['httpd'],
  }
  file { '/var/www/html':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    source  => 'https://raw.githubusercontent.com/Fenikks/devops-files-23.08/a347abdd2891ef07949e416d1c896fd8cbc84313/02-tools/files/index.html',
    require => Package['httpd'],
  }
  service { 'httpd':
    ensure    => running,
    enable    => true,
    hasstatus => true,
    hasrestart => true,
  }
}