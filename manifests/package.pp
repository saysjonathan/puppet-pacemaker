# = Class: pacemaker::package
# This class manages the pacemaker package(s)
#
# == Parameters:
# $package:: Pacemaker pacakge(s) [String, Array]
#
# == Sample Usage:
# The $package param can be set from the main pacemaker interface:
#   class { 'pacemaker':
#     package => 'pacemaker-dev'
#   }

class pacemaker::package (
  $package
) {

  package { $package:
    ensure => installed
  }
}
