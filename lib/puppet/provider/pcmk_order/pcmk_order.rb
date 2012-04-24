Puppet::Type.type(:pcmk_order).provide(:pcmk_order) do
  desc 'Pacmaker resource order provider'

  optional_commands :crm => '/usr/sbin/crm'

  def create
    debug 'Creating resource %s' % resource[:name]
    crm 'configure', 'order', resource[:name], "#{resource[:score]}:", resource[:order].join(' ')
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
