Puppet::Type.type(:pcmk_rsc_defaults).provide(:pcmk_rsc_defaults) do
  desc 'Pacemaker resource defaults provider'

  optional_commands :crm => '/usr/sbin/crm'

  def create
    debug 'Creating resource %s' % resource[:name]
    crm 'configure', 'rsc_defaults', "#{resource[:name]}=#{resource[:value]}"
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
