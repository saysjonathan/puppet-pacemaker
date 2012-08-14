Puppet::Type.newtype :pcmk_location do
  @doc = 'Type to manage Pacemaker resource locations'

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
    desc 'Name of location resource'
    isnamevar
  end

  newparam :resource do
    desc 'Name of resource to apply the rule'
  end

  newparam :node do
    desc 'Node for location resource'
  end

  newparam :score do
    desc 'Node score for resource location'
  end

  newparam :attribute do
    desc 'Name of rule attribute'
  end

  newparam :operation do
    desc 'Name of rule operation'
  end

  newparam :value do
    desc 'Attribute operation value'
  end
end
