class mongodb {
  package { "mongodb-server":
    ensure => installed;
  }
}
