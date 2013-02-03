class git {
  package { "git-core":
    ensure => installed;
  }

  file {"/home/vagrant/.gitconfig":
    source => "puppet:///modules/git/gitconfig",
    ensure => present;
  }
}
