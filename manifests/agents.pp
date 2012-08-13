# = Class: pacemaker::agents
# This class installs additional resource agents
#
# == Parameters:
# $additional_agents:: Install additional agents or not [Bool]

class pacemaker::agents (
  $additional_agents
) {
  if($additional_agents) {
    file { '/usr/lib/ocf/resource.d/percona/':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0644'
    }

    file { '/usr/lib/ocf/resource.d/percona/mysql':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      source  => 'puppet:///modules/pacemaker/prm_mysql',
      require => File['/usr/lib/ocf/resource.d/percona/']
    }

    file { '/usr/lib/ocf/resource.d/heartbeat/generic-daemon':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => 'puppet:///modules/pacemaker/generic-daemon'
    }

    file { '/usr/lib/ocf/resource.d/heartbeat/generic-script':
      ensure => present,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      source => 'puppet:///modules/pacemaker/generic-script'
    }
  }
}
