Puppet::Type.newtype(:pcmk_property) do
  @doc = 'Type to manage Pacemaker cluster properties'

  ensurable do
    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end

    defaultto :present
  end

  newparam(:name) do
    desc 'Name of property'
    isnamevar
  end

  newproperty(:value) do
    desc 'Resource property value'
  end
end
