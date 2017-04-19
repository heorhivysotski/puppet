# Add current repo
class puppet::common (String $server = '1.europe.epam.com'){
  yumrepo { 'rpm':
    ensure   => 'present',
    baseurl  => $::puppet::rep_url,
    gpgkey   => $::puppet::gpg_keys,
    enabled  => '1',
    gpgcheck => '1',
  }

  package { 'ntp':
    ensure => latest
   }
   
  file {'/etc/ntp.conf':
   ensure  => file,
   content => template('puppet/temp.erb'),
   notify  => Service[ntpd], 
  } 
 
  service { 'ntpd':
    ensure => 'running',
    enable => true,
    require => Package['ntp'],
  }
}

