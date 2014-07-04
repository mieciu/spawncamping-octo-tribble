node default {

  class { '::ntp':
    servers => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
  }

  cron { 'taki_sobie_maintenance':
    command => "/usr/bin/skrypt_robiacy_porzadek.sh",
    user    => root,
    hour    => 5,
    minute  => 0,
  }

  $str = "Jestem DNSem google"

  if $::ipaddress_eth0 == "8.8.8.8" { 
    file { '/root/pliczQ':
      ensure => present,
      content => "$str",
      owner  => root,
      group  => root,
      mode => '644',
    }   
  }

}
