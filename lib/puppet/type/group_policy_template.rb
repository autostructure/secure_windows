Puppet::Type.newtype(:group_policy_template) do
  desc 'Puppet type that supports Windows group policy templates.'

  # ensurable

  ensurable do
    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end

    newvalue(:purged) do
      # provider.purge
    end

    newvalue(:held) do
      # provider.hold
    end
  end

  newparam(:name, namevar: :true) do
    desc 'Group policy security template name'

    validate do |value|
      raise ArgumentError, "You must supply a path to the template file ':'" if value.nil?
    end

    # dbfile = 'c:\Windows\security\database\secedit.sdb'
    # templatefile = 'c:\tmp\MSS-Legacy.admx' # MSS-Legacy.admx, MSS-Legacy.adml
    logfile = 'c:\Windows\security\logs\puppet-secedit.log'

    provider.load(:load_template, :sdb_filepath, logfile)
  end

  newparam(:sdb_filepath) do
    desc 'Path to the security database file'
  end

  newparam(:load_template) do
    desc 'Path to the group policy template file (*.admx)'
  end

  def pre_run_check
    if self[:sdb_filepath].nil?
      raise Puppet::Error, 'A path to the policy database is required!'
    end

    if self[:load_template].nil?
      raise Puppet::Error, 'A path to the group policy template file is required (*.admx)!'
    end
  end
end
