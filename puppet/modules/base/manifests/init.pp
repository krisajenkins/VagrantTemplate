class base {
  exec { "apt-update":
    command => "/usr/bin/apt-get update";
  }

  package { "apt-utils":
    ensure => installed;
  }

  package { "python-software-properties":
    require => Exec["apt-update"],
    ensure => installed;
  }
}
