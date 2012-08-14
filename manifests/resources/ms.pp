# = Class pacemaker::resources::ms
# This class creates a single or multiple instances of pcmk_ms
#
# == Parameters:
# $ms:: Create primary and secondary nodes for a given resource [Hash]

class pacemaker::resources::ms (
  $ms
) {
  if($ms) {
    create_resources('pcmk_ms', $ms)
  }
}
