# = Class: pacemaker
# This class manages pacemaker and it's configuration
# 
# == Parameters:
# See pacemaker subclasses for more info on each parameter.
#
# == Sample Usage:
# This class is used to manage the whole of pacemaker through a single interface. Calling the class without any parameters will setup pacemaker for use with corosync, without any resources:
#   class { 'pacemaker': }
#
# Resources can be configured from this class:
#   class { 'pacemaker':
#     vips => {
#       'vip1' => {
#         'ip'      => '33.33.33.13'
#         'cidr'    => '32',
#         'op'      => 'monitor',
#         'interval => '5s'
#       }
#     }
#   }

class pacemaker (
  $clones              = {},
  $colocations         = {},
  $locations           = {},
  $orders              = {},
  $package             = $package,
  $quorum              = $quorum,
  $resource_stickiness = false,
  $service             = $service,
  $stonith             = $stonith,
  $symmetric_cluster   = $symmetric_cluster,
  $transport           = $transport,
  $vips                = {}
) inherits pacemaker::defaults {

  Pacemaker::Anchor["${module_name}::begin"] -> Class["${module_name}::package"] -> Class["${module_name}::service"] -> Class["${module_name}::properties"] -> Class["${module_name}::resources"] -> Pacemaker::Anchor["${module_name}::end"]

  pacemaker::anchor { "${module_name}::begin": }
  
  class { "${module_name}::package":
    package => $package
  }

  class { "${module_name}::service":
    service               => $service,
    transport             => $transport,
    corosync_service_file => $corosync_service_file
  }

  class { "${module_name}::properties":
    stonith             => $stonith,
    quorum              => $quorum,
    resource_stickiness => $resource_stickiness,
    symmetric_cluster   => $symmetric_cluster
  }

  class { "${module_name}::resources":
    clones      => $clones,
    colocations => $colocations,
    locations   => $locations,
    orders      => $orders,
    vips        => $vips
  }

  pacemaker::anchor { "${module_name}::end": }
}
