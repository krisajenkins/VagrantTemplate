class lein {
  file {["/home/vagrant/.lein/", "/home/vagrant/bin"]:
    ensure => directory,
    owner => "vagrant",
    group => "vagrant",
  }

  file {"/home/vagrant/.lein/profiles.clj":
    source => "puppet:///modules/lein/profiles.clj",
    require => File["/home/vagrant/.lein/"],
    ensure => present,
    owner => "vagrant",
    group => "vagrant",
  }

  file {"/home/vagrant/bin/lein":
    source => "puppet:///modules/lein/lein",
    require => File["/home/vagrant/bin/"],
    ensure => present,
    mode => 755,
    owner => "vagrant",
    group => "vagrant",
  }

  exec {"install-lein":
    require => File["/home/vagrant/bin/lein"],
    command => "/home/vagrant/bin/lein",
    creates => "/home/vagrant/.lein/self-installs/leiningen-2.0.0-standalone.jar",
  }
}
