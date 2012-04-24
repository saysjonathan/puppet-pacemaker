Puppet::Type.newtype(:pcmk_property) do
  @doc = 'Type to manage Pacemaker cluster properties'

  ensurable do
    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

  newparam(:name) do
    desc 'Name of property'
    isnamevar
  end

  newparam(:value) do
    desc 'Resource property value'
  end

  newparam(:id) do
    desc 'Property id'
  end
end
