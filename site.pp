# install current version of puppet
node default {
  include 'puppet'
  class {'puppet::common':
  server => 'server 12.europe.pool.ntp.org' 
 } 
}
