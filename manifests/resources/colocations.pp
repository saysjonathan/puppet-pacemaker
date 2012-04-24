# = Class: pacemaker::resources::locations
# This class creates a single or multiple instances of pcmk_colocation
#
# == Parameters:
# $colocations:: Preference of nodes for a given resource [Hash]
#
# == Sample Usage:
# The $colocations parameter will be used to instantiate pcmk_colocation resources, so each colocation entry must use the same properties as a regular pcmk_colocation resource:
# class { 'pacemaker':
#   vips => {
#     'vip1' => {
#       'ip'       => '33.33.33.13',
#       'cidr'     => '32',
#       'op'       => 'monitor',
#       'interval' => '5s',
#       'ensure'   => 'present'
#     },
#     'vip2' => {
#       'ip'       => '33.33.33.14',
#       'cidr'     => '32',
#       'op'       => 'monitor',
#       'interval' => '5s',
#       'ensure'   => 'present'
#     }
#   }
#   colocations => {
#     'vip1_and_vip2' => {
#       'resources' => ['vip1', 'vip2']
#       'score'     => 'INFINITY'
#     }
#   }
# }

class pacemaker::resources::colocations (
  $colocations
) {
  if($colocations) {
    create_resources('pcmk_colocation', $colocations)
  }
}
