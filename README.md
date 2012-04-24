# puppet-pacemaker

## Description
This module provides a base class for managing pacemaker.

## Usage
### Manifests
Note: While any subclasses can be called independently, the main class is the preferred entry point.
      When calling subclasses, no defaults will be populated and you must provide values for all class parameters.

Calling pacemaker without any parameters will install, start, and configure pacemaker without defining any resources:
  
    class { 'pacemaker': }

Values for subclass parameters can be passed in through the main class. For example, to use an alternative transport:
  
    class { 'pacemaker':
      transport => 'heartbeat'
    }

Adding virtual IPs:

    class { 'pacemaker':
      vips => {
        'vip1' => {
          'ip'   => '33.33.33.13',
          'cidr' => '32',
          'op'   => 'monitor',
          'interval' => '5s',
          'ensure'   => 'present'
        }
      }
    }

See this modules subclasses for a list of accepted parameters and the data type expected.
