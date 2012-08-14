Puppet::Type.newtype(:pcmk_prm) do
  @doc = 'Type to manage Pacemaker Percona Replication Manager resources'

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
    desc 'Name of the resource'
    isnamevar
  end

  newparam :binary do
    desc 'Path of the mysql binary'
  end

  newparam :client_binary do
    desc 'Path of the mysql-client binary'
  end

  newparam :config do
    desc 'Path of the mysql config'
  end

  newparam :datadir do
    desc 'Path of the directory containing the database'
  end

  newparam :user do
    desc 'Unix user to run mysql under'
  end

  newparam :group do
    desc 'Unix group to run mysql under'
  end

  newparam :log do
    desc 'Logfile used for mysqld'
  end

  newparam :pid do
    desc 'Path to the mysqld PID'
  end

  newparam :socket do
    desc 'Path to the mysqld socket file'
  end

  newparam :test_table do
    desc 'Table used to test mysql with select count(*)'
  end

  newparam :test_user do
    desc 'The MySQL user performing the test on the test table.'
  end

  newparam :test_passwd do
    desc 'Password of the test user.'
  end

  newparam :enable_creation do
    desc 'Runs mysql_install_db if the datadir is not configured.'
  end

  newparam :additional_parameters do
    desc 'Additional MySQL parameters passed.'
  end

  newparam :replication_user do
    desc 'The MySQL user to use in the change master to master_user command.'
  end

  newparam :replication_passwd do
    desc 'The password of the replication_user.'
  end

  newparam :replication_port do
    desc 'TCP Port to use for MySQL replication.'
  end

  newparam :max_slave_lag do
    desc 'The maximum number of seconds a replication slave is allowed to lag behind its master. Do not set to 0'
  end

  newparam :evict_outdated_slaves do
    desc 'Instructs the resource agent how to react if the slave is lagging behind by more than max_slave_lag.'
  end

  newparam :reader_attribute do
    desc 'Name of the transient attribute that can be used to adjust the behavior of the cluster given the state of the slave.'
  end

  newparam :master_monitor_interval do
    desc 'Master resource monitor interval'
    defaultto '5s'
  end

  newparam :slave_monitor_interval do
    desc 'Slave resource monitor interval'
    defaultto '2s'
  end
end
