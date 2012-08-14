Puppet::Type.newtype :pcmk_ms do
  @doc = 'Type to manage Pacemaker master-slave resources'

  ensurable do
    newvalue :present do
      provider.create
    end

    newvalue :absent do
      provider.destroy
    end

    defaultto :present
  end

  newparam :name do
    desc 'Name of ms resource'
    isnamevar
  end

  newparam :resource do
    desc 'Resource to create master and slave instances'
  end

  newparam :master_max do
    desc 'Maximum number of masters'
  end

  newparam :master_node_max do
    desc 'Maximum number of masters per node'
  end

  newparam :clone_max do
    desc 'Maximum number of clones (slaves)'
  end

  newparam :clone_node_max do
    desc 'Maximum number of clone (slaves) per node'
  end

  newparam :notification do
    desc 'Notify'
    defaultto 'true'
  end

  newparam :globally_unique do
    desc 'Global uniqueness of cloned resources'
    defaultto 'false'
  end

  newparam :target_role do
    desc 'Target role of cloned resource'
    defaultto 'started'
  end

  newparam :managed do
    desc 'Manage cloned resources'
    defaultto 'true' 
  end
end
