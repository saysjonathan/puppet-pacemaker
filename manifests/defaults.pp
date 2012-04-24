# = Class pacemaker::defaults
# This class provides default values for all pacemkaer classes
#
# == Parameters
# These parameters can be overridden from the base or specific class

class pacemaker::defaults {
  $package               = 'pacemaker'
  $service               = 'pacemaker'
  $corosync_service_file = '/etc/corosync/service.d/pcmk'
  $transport             = 'corosync'
  $quorum                = 'ignore'
  $symmetric_cluster     = true
  $stonith               = false
}
