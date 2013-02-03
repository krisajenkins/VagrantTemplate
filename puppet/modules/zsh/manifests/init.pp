class zsh {
  package { "zsh":
    ensure => installed;
  }

  file {"/home/vagrant/.zshrc":
    source => "puppet:///modules/zsh/zshrc",
    ensure => present;
  }

  user {"vagrant":
    require => Package["zsh"],
    shell => "/bin/zsh";
  }
}
