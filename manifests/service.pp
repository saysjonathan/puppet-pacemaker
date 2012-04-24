# = Class: pacemaker::service
# This class manages the pacemaker service and the corosync
# service file
#
# == Parameters:
# $service:: Pacemaker service name [String]
# $corosync_service_file:: Pacemaker service file for corosync [String]
# $transport:: Pacemaker transport system [String]
#
# == Sample Usage
# You can override all parameters from the main interface:
#   class { 'pacemaker':
#     transport => 'heartbeat',
#     service   => 'pacemakerd'
#   }

class pacemaker::service (
  $service,
  $transport,
  $corosync_service_file
) {
  
  if $transport == 'corosync' {
    file { $corosync_service_file:
      ensure  => present,
      content => template("${module_name}/pcmk.erb"),
      mode    => '0644',
      notify  => Exec['pcmk-stack-restart']
    }
  }

  service { $service:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true
  }

  exec { 'pcmk-stack-restart':
    command     => "service pacemaker stop && service ${transport} restart && service pacemaker start",
    path        => ['/bin', '/sbin'],
    onlyif      => "service ${transport} status",
    refreshonly => true
  } 
}
