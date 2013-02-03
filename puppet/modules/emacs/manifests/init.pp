class emacs {
  exec { "add-emacs-repo":
    require => Package["python-software-properties"],
    command => "/usr/bin/add-apt-repository --yes ppa:cassou/emacs ; apt-get update",
	creates => "/etc/apt/sources.list.d/cassou-emacs-precise.list"
  }

  package { "emacs":
    ensure => purged;
  }

  file {"/home/vagrant/.emacs":
    source => "puppet:///modules/emacs/dotemacs",
    ensure => present;
  }

  package { "emacs24":
    require => Exec["add-emacs-repo"],
    ensure => installed;
  }
}
