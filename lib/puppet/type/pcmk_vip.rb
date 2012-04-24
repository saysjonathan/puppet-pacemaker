Puppet::Type.newtype(:pcmk_vip) do
  @doc = 'Type to manage pacemaker ocf::heartbeat:IPaddr2 resources'

  ensurable do
    newvalue :present do
      provider.create
    end

    newvalue :absent do
      provider.destroy
    end
  end

  newparam :name do
    desc 'Name of resource'
    isnamevar
  end

  newparam :ip do
    desc 'Address of VIP'
  end

  newparam :cidr do
    desc 'Cidr netmask of VIP address'
  end

  newparam :op do
    desc 'VIP operation'
  end

  newparam :interval do
    desc 'VIP operation interval'
  end

  newparam :nic do
    desc 'Network interface for virtual IP'
  end

  newparam :clusterip_hash do
    desc 'No fucking clue what this does'
  end
end
