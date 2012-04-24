# = Class: pacemaker::resources
# This class manages pacemaker resources
#
# == Parameters:
# $vips:: VIPs for the pacemaker cluster [Hash]
# $clones:: Resource clones for multiple active resources [Hash]
#
# == Notes:
# These are split into separate classes to ensure the resources are instantiated in the correct order.

class pacemaker::resources(
  $clones,
  $colocations,
  $locations,
  $orders,
  $vips
) {

  Pacemaker::Anchor["${module_name}::resources::begin"] -> Class["${module_name}::resources::vips"] -> Class["${module_name}::resources::clones"] ->
  Class["${module_name}::resources::locations"] -> Class["${module_name}::resources::colocations"] -> Class["${module_name}::resources::orders"] ->
  Pacemaker::Anchor["${module_name}::resources::end"]

  pacemaker::anchor { "${module_name}::resources::begin": }

  class { "${module_name}::resources::vips":
    vips => $vips
  }

  class { "${module_name}::resources::clones":
    clones => $clones
  }

  class { "${module_name}::resources::locations":
    locations => $locations
  }

  class { "${module_name}::resources::colocations":
    colocations => $colocations
  }

  class { "${module_name}::resources::orders":
    orders => $orders
  }

  pacemaker::anchor { "${module_name}::resources::end": }
}
