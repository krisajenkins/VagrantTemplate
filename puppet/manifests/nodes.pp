node "precise64" {
  include vim
  include zsh

  user {"vagrant":
    require => Package["zsh"],
    shell => "/bin/zsh";
  }
}
