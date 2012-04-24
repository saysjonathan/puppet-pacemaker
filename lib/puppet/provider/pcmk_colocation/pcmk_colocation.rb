Puppet::Type.type(:pcmk_colocation).provide(:pcmk_colocation) do
  desc 'Pacmaker resource colocation provider'

  optional_commands :crm => '/usr/sbin/crm'

  def create
    debug 'Creating resource %s' % resource[:name]
    crm 'configure', 'colocation', resource[:name], "#{resource[:score]}:", resource[:resources].join(' ')
  end

  def destroy
    debug 'Destroying resource %s' % resource[:name]
    debug 'No destroy for you!'
  end

  def exists?
    debug 'Checking status of %s' % resource[:name]
    return false
  end
end
