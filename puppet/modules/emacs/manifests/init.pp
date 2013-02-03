class emacs {
  exec { "add-emacs-repo":
    require => Package["python-software-properties"],
    command => "/usr/bin/add-apt-repository --yes ppa:cassou/emacs",
  }

  exec { "make-emacs-available":
    command => "/usr/bin/apt-get update",
    require => Exec["add-emacs-repo"];
  }

  package { "emacs":
    ensure => purged;
  }

  file {"/home/vagrant/.emacs":
    source => "puppet:///modules/emacs/dotemacs",
    ensure => present;
  }

  package { "emacs24":
    require => Exec["make-emacs-available"],
    ensure => installed;
  }

}
