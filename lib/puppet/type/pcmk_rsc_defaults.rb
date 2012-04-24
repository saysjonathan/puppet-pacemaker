Puppet::Type.newtype(:pcmk_rsc_defaults) do
  @doc = 'Type to manage Pacemaker resource defaults'

  ensurable do
    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end

  newparam(:name) do
    desc 'Name of resource default setting'
    isnamevar
  end

  newparam(:value) do
    desc 'Resource default value'
  end
end
