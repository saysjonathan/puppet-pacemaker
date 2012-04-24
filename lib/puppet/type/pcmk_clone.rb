Puppet::Type.newtype(:pcmk_clone) do
  @doc = 'Type to manage Pacemaker resource clones'

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

  newparam :resource do
    desc 'Name of the resource to clone'
  end

  newparam :globally_unique do
    desc 'Global uniqueness of cloned resource'
    newvalues(:true, :false)
  end

  newparam :max do
    desc 'Maximum number of clones'
  end

  newparam :max_nodes do
    desc 'Maximum number of nodes with clones'
  end
end
