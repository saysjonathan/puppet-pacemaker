# = Class: pacemaker::resources::orders
# This class creates a single or multiple instances of pcmk_order
#
# == Parameters:
# $orders:: Order of actions on resources [Hash]
#
# == Sample Usage:
# The $orders parameter will be used to instantiate pcmk_order resources, so each order entry must use the same properties as a regular pcmk_order resource:
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
#     },
#   },
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
#   },
#   colocations => {
#     'vip1_and_vip2' => {
#       'resources' => ['vip1', 'vip2'],
#       'score'     => 'INFINITY'
#     }
#   },
#   orders => {
#     'vip1_before_vip2' => {
#       'order' => ['vip1', 'vip2'],
#       'score' => 'mandatory'
#     }
#   }
# }

class pacemaker::resources::orders (
  $orders
) {
  if($orders) {
    create_resources('pcmk_order', $orders)
  }
}
