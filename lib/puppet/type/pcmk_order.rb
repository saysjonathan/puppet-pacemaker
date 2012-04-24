Puppet::Type.newtype :pcmk_order do
  @doc = 'Type to manage Pacemaker resource orders'

  ensurable do
    newvalue :present do
      provider.create
    end

    newvalue :absent do
      provider.destroy
    end
  end

  newparam :name do
    desc 'Name of order resource'
    isnamevar
  end

  newparam :order do
    desc 'Order of resource actions'
  end

  newparam :score do
    desc 'Node score for resource order'
  end
end
