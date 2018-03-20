# gpedit.rb
#
Puppet::Type.type(:group_policy_template).provide(:gpedit) do
  desc 'Puppet custom type provider that loads Windows group policy templates.'

  confine osfamily: :windows
  defaultfor operatingsystem: :windows
  commands gpedit: 'gpedit'

  def read_admx_file; end

  def read_adml_file; end

  def generateRegistryKeys; end

  def instances
    # parse template xml and output resource code to be used by puppetlabs
    # by calling "generateRegistryKeys".
    # registry::value class...
    # registry::value { 'v73487':
    #   key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI',
    #   value => 'EnumerateAdministrators',
    #   type  => 'dword',
    #   data  => '0x00000000',
    # }
    #
    # registry::value { 'v73651':
    #   key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    #   value => 'CachedLogonsCount',
    #   type  => 'string',
    #   data  => '4',
    # }
  end

  def exists?
    # get_domain_key_value(resource[:domain], resource[:key]) != nil
  end

  def create
    # drop *.admx and *.adml into %SystemRoot%\PolicyDefinitions (and en-US sub-dir)

    # start up gpedit.msc to apply changes

    # note: appears you have to manually apply template.
    # note: can't find value for key in xml files.
    # fix for note above:
    # see the <presentationTable> section of the *.adml file.
    # the
    # <presentation id="KeepAliveTime">
    #    <dropdownList refId="KeepAliveTime" noSort="true" defaultItem="1">KeepAliveTime</dropdownList>
    # </presentation>
    # The defaultItem="1" property tells me which value to use for multiple options.

    # secedit(['/configure', '/db', dbfile, '/cfg', templatefile, '/log', logfile])
  end

  def destroy
    #
  end
end
