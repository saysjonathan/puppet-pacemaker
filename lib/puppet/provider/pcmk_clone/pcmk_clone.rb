Puppet::Type.type(:pcmk_clone).provide(:pcmk_clone) do
  desc 'Pacemaker resource clone provider'

  optional_commands :crm => '/usr/sbin/crm'
  optional_commands :crm_resource => '/usr/sbin/crm_resource'

  def create
    debug 'Creating clone %s' % resource[:name]
    crm 'configure', 'clone', arguments
  end

  def destroy
    debug 'Destroying clone %s' % resource[:name]
    crm 'resource', 'stop', resource[:name]
    crm 'configure', 'delete', resource[:name]
  end

  def exists?
    debug 'Checking existence of %s' % resource[:name]
    status = crm_resource '--list'
    if status =~ /#{resource[:name]}/
      true
    else
      false
    end
  end

  def arguments
    args = []
    args << resource[:name]
    args << resource[:resource]

    #if resource[:globally_unique] | resource[:max] | resource[:max_nodes]
    #  args << 'meta'
    #end
    
    args << "meta globally-unique=#{resource[:globally_unique]}" if resource[:globally_unique]
    args << "clone-max=#{resource[:max]}" if resource[:max]
    args << "clone-node-max=#{resource[:max_nodes]}" if resource[:max_nodes]
    args
  end
end
