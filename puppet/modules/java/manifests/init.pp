class java {
  exec { "add-java-repo":
    require => Package["python-software-properties"],
    command => "/usr/bin/add-apt-repository --yes ppa:webupd8team/java ; apt-get update",
	creates => "/etc/apt/sources.list.d/webupd8team-java-precise.list"
  }

  file { "/var/cache/debconf/java7.seeds":
    source => "puppet:///modules/java/java7.seeds",
    ensure => present;
  }

  package { "oracle-java7-installer":
    require => [Exec["add-java-repo"],
                File["/var/cache/debconf/java7.seeds"]],
    responsefile => "/var/cache/debconf/java7.seeds",
    ensure => "installed",
  }
}
