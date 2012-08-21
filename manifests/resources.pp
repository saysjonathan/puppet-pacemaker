# = Class: pacemaker::resources
# This class manages pacemaker resources
#
# == Parameters:
# $vips:: VIPs for the pacemaker cluster [Hash]
# $clones:: Resource clones for multiple active resources [Hash]
#
# == Notes:
# These are split into separate classes to ensure the resources are instantiated in the correct order.

class pacemaker::resources (
  $clones,
  $colocations,
  $generic_daemons,
  $locations,
  $ms,
  $prms,
  $orders,
  $vips
) {

  pacemaker::anchor { "${module_name}::resources::begin": }
  ->
  class { "${module_name}::resources::vips":
    vips => $vips
  }
  ->
  class { "${module_name}::resources::generic_daemons":
    generic_daemons => $generic_daemons
  }
  ->
  class { "${module_name}::resources::prms":
    prms => $prms
  }
  ->
  class { "${module_name}::resources::clones":
    clones => $clones
  }
  ->
  class { "${module_name}::resources::ms":
    ms => $ms
  }
  ->
  class { "${module_name}::resources::locations":
    locations => $locations
  }
  ->
  class { "${module_name}::resources::colocations":
    colocations => $colocations
  }
  ->
  class { "${module_name}::resources::orders":
    orders => $orders
  }
  ->
  pacemaker::anchor { "${module_name}::resources::end": }
}
