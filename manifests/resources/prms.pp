# = Class: pacemaker::resource::prms
# This class creates single or multiple instances of Percona's mysql resource,
# AKA Percona Replication Manager
#
# == Parameters:
# $prms:: PRM resources to configure [Hash]

class pacemaker::resources::prms (
  $prms
) {
  if($prms) {
    create_resources('pcmk_prm', $prms)
  }
}
