class zsh {
  package { "zsh":
    ensure => installed;
  }

  file {"/home/vagrant/.zshrc":
    source => "puppet:///modules/zsh/zshrc",
    ensure => present;
  }
}
