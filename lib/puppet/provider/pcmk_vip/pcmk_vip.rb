Puppet::Type.type(:pcmk_vip).provide(:pcmk_vip) do
  desc 'Pacemaker ocf::heartbeat:IPaddr2 provider'

  optional_commands({
    :crm          => '/usr/sbin/crm',
    :crm_resource => '/usr/sbin/crm_resource'
  })

  def create 
    debug 'Creating VIP %s' % resource[:name]
    crm 'configure', 'primitive', resource[:name], 'ocf:heartbeat:IPaddr2', 'params', args
  end

  def destroy
    debug 'Destroying resource %s' % resource[:name]
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

  def args
    debug 'Building args for %s' % resource[:name]
    args = []
    args << "ip=#{resource[:ip]}"
    args << "cidr_netmask=#{resource[:cidr]}"
    args << "nic=#{resource[:nic]}" if resource[:nic]
    args << "clusterip_hash=#{resource[:clusterip_hash]}" if resource[:clusterip_hash]
    args << "op"
    args << resource[:op]
    args << "interval=#{resource[:interval]}"
  end
end
