Puppet::Type.type(:pcmk_location).provide(:pcmk_location) do
  desc 'Pacmaker resource location provider'

  optional_commands :crm => '/usr/sbin/crm'

  def create
    debug 'Creating resource %s' % resource[:name]
    crm 'configure', 'location', resource[:name], resource[:resource], "#{resource[:score]}:", resource[:node]
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
