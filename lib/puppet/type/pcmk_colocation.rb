Puppet::Type.newtype :pcmk_colocation do
  @doc = 'Type to manage Pacemaker resource colocations'

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
    desc 'Name of colocation resource'
    isnamevar
  end

  newparam :resources do
    desc 'Name of resources to apply the rule'
  end

  newparam :score do
    desc 'Node score for resource location'
  end
end
