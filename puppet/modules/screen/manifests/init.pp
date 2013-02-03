class screen {
  package { "screen":
    ensure => installed;
  }

  file {"/home/vagrant/.screenrc":
    source => "puppet:///modules/screen/screenrc",
    ensure => present;
  }
}
