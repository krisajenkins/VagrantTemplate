class base {
  exec { "apt-update":
    command => "/usr/bin/apt-get update";
  }

  package { "apt-utils": ensure => installed; }
  package { "curl": ensure => installed; }
  package { "wget": ensure => installed; }
  package { "g++": ensure => installed; }
  package { "make": ensure => installed; }

  package { "python-software-properties":
    require => Exec["apt-update"],
    ensure => installed;
  }
}
