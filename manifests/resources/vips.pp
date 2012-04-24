# = Class: pacemaker::resources::vips
# This class creates single or multiple instances of pcmk_vip
#
# == Parameters:
# $vips:: Virtual IPs for the pacemaker cluster [Hash]
#
# == Sample Usage:
# The $vips parameter will be used to instantiate pcmk_vip resource, so each vip entry must use the same properties as a regular pcmk_vip resource:
#  class { 'pacemaker':
#    vips => {
#      'vip1' => {
#        'ip'   => '33.33.33.13',
#        'cidr' => '32',
#        'op'   => 'monitor',
#        'interval' => '5s',
#        'ensure'   => 'present'
#      },
#      'vip2' => {
#        'ip'   => '33.33.33.14',
#        'cidr' => '32',
#        'op'   => 'monitor',
#        'interval' => '5s',
#        'ensure'   => 'present'
#      }
#    }
#  }

class pacemaker::resources::vips (
  $vips
) {
  if($vips) {
    create_resources('pcmk_vip', $vips)
  }
}
