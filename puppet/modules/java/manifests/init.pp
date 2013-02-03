class java {
  exec { "add-java-repo":
    command => "/usr/bin/add-apt-repository --yes ppa:webupd8team/java",
    require => Package["python-software-properties"];
  }

  exec { "make-java-available":
    command => "/usr/bin/apt-get update",
    require => Exec["add-java-repo"];
  }

  package { "oracle-java7-installer":
    ensure => "installed",
    require => [File["/var/cache/debconf/java7.seeds"],
                Exec["make-java-available"]],
    responsefile => "/var/cache/debconf/java7.seeds";
  }

  file { "/var/cache/debconf/java7.seeds":
    source => "puppet:///modules/java/java7.seeds",
    ensure => present;
  }
}
