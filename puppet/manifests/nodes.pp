node "precise64" {
  include base
  include vim
  include zsh
  include git
  include java

  user {"vagrant":
    require => Package["zsh"],
    shell => "/bin/zsh";
  }
}
