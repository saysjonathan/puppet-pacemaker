Puppet::Type.type(:pcmk_property).provide(:pcmk_property) do
  desc 'Pacemaker property provider'

  optional_commands :crm => '/usr/sbin/crm'

  def create
    debug 'Creating resource %s' % resource[:name]
    crm 'configure', 'property', "#{resource[:name]}=#{resource[:value]}"
  end

  def destroy
    debug 'Destroying property %s' % resource[:name]
    debug 'No destroy for you!'
  end

  def exists?
    debug 'Checking status of %s' % resource[:name]
    return false
  end
end
