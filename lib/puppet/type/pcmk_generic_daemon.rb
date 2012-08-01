Puppet::Type.newtype :pcmk_generic_daemon do
  @doc = 'Type to manage Pacemaker generic-daemon resources'

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
    desc 'Name of generic-daemon resource'
    isnamevar
  end

  newparam :initd do
    desc 'Path of initd script'
  end

  newparam :pidfile do
    desc 'Path of pidfile'
  end

  newparam :monitor do
    desc 'Monitor interval'
  end
end
