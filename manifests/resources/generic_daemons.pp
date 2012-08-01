# = Class: pacemaker::resources::generic_daemons
# This class creates single or multiple instances of pcmk_generic_daemon
#
# == Parameters:
# $generic_daemons:: Configure generic-daemon resources [Hash]
#
# == Sample Usage:
# The $generic-daemons parameter will be used to instantiate pcmk_generic_daemon resources, so each daemon entry must use the same properties as a regular pcmk_generic_daemon resource:
#  class { 'pacemaker':
#    generic_daemons => {
#      'httpd' => {
#        'initd'  => '/etc/init.d/apache2',
#        'pidfile => '/var/run/httpd/apache2.pid',
#        'monitor => '5s'
#      },
#      'pdns_recursor' => {
#        'initd'   => '/etc/init.d/pdns-recursor',
#        'pidfile' => '/var/run/pdns_recursor.pid',
#        'monitor' => '5s'
#      }
#    }
#  }

class pacemaker::resources::generic_daemons (
  $generic_daemons
) {
  if($generic_daemons) {
    create_resources('pcmk_generic_daemon', $generic_daemons)
  }
}
