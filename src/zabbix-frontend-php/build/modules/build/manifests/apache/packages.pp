class build::apache::packages {
  package {[
      'apache2',
      'apache2-utils'
    ]:
    ensure => present
  }
}
