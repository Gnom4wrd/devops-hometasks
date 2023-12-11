class dynamic_site {
  package { ['nginx', 'python3', 'python3-pip']:
    ensure => installed,
  }
  package { ['flask', 'gunicorn']:
    ensure   => installed,
    provider => pip3,
  }
  file { '/etc/nginx/conf.d/dynamic_site.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('dynamic_site/dynamic_site.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
  file { '/opt/dynamic_site':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    recurse => true,
    source  => 'https://raw.githubusercontent.com/Fenikks/devops-files-23.08/a347abdd2891ef07949e416d1c896fd8cbc84313/02-tools/files/index.php',
    require => Package['python3'],
  }
  file { '/etc/systemd/system/dynamic_site.service':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('dynamic')
  }  
}