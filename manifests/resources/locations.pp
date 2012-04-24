# = Class: pacemaker::resources::locations
# This class creates a single or multiple instances of pcmk_location
#
# == Parameters:
# $locations:: Preference of nodes for a given resource [Hash]
#
# == Sample Usage:
# The $locations parameter will be used to instantiate pcmk_location resources, so each location entry must use the same properties as a regular pcmk_location resource:
# class { 'pacemaker':
#   vips => {
#     'vip1' => {
#       'ip'   => '33.33.33.13',
#       'cidr' => '32',
#       'op'   => 'monitor',
#       'interval' => '5s',
#       'ensure'   => 'present'
#     }
#   }
#   locations => {
#     'vip1_master' => {
#       'resource' => 'vip1',
#       'node'     => $host1,
#       'score'    => '150'
#     },
#     'vip1_slave' => {
#       'resource' => 'vip1',
#       'node'     => $host2,
#       'score'    => '200'
#     }
#   }
# }

class pacemaker::resources::locations (
  $locations
) {
  if($locations) {
    create_resources('pcmk_location', $locations)
  }
}
