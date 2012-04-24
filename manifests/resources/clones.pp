# = Class: pacemaker::resources::vips
# This class creates single or multiple instances of pcmk_clone
#
# == Parameters:
# $clone:: Resource clones for multiple active resources [Hash]
#
# == Sample Usage:
# The $clones parameter will be used to instantiate pcmk_clone resources, so each $clone entry must use the same properties as a regular pcmk_clone resource:
# class { 'pacemaker': 
#   vips => {
#     'vip1' => {
#       'ip'       => '33.33.33.13',
#       'cidr'     => '32',
#       'op'       => 'monitor',
#       'interval' => '5s',
#       'ensure'   => 'present'
#     }
#   },
#   clones => {
#     'vip1_clone' => {
#       'source'          => 'vip1',
#       'globally_unique' => 'true',
#       'max'             => 2,
#       'max_nodes'       => 2,
#       'ensure'          => 'present'
#     }
#   }
# }

class pacemaker::resources::clones (
  $clones
) {
  if($clones) {
    create_resources('pcmk_clone', $clones)
  }
}
