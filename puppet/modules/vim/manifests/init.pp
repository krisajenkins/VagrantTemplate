class vim {
  package { "vim":
    ensure => installed;
  }

  file {"/home/vagrant/.vimrc":
    source => "puppet:///modules/vim/vimrc",
    ensure => present;
  }
}
