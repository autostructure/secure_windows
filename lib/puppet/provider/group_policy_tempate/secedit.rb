# secedit.rb
#
# NOTE: deprecated.
# secedit loads *.inf files.
# The *.inf files are an older policy file format.
# the secedit command won't load *.admx/*.adml template data.
#
# secedit /configure /db FileName [/cfg FileName ] [/overwrite][/areas area1 area2...] [/log FileName] [/quiet]
# %windir%\security\database drectory (where %windir% is the drive and path to your Windows directory).
# secedit /configure /db mysecure.sdb /areas FILESTORE /log %windir% \security\logs\Mysecure.log /verbose.
Puppet::Type.type(:group_policy_template).provide(:secedit) do
  desc 'Puppet custom type provider that loads Windows group policy templates.'

  confine osfamily: :windows
  defaultfor operatingsystem: :windows
  confine exists: 'c:\\Windows\\security\\database\\secedit.sdb'
  commands secedit: 'secedit'

  # dbfile = 'c:\Windows\security\database\secedit.sdb'
  # templatefile = 'c:\tmp\MSS-Legacy.admx' # MSS-Legacy.admx, MSS-Legacy.adml
  # logfile = 'c:\Windows\security\logs\puppet-secedit.log'

  def exists?
    # get_domain_key_value(resource[:domain], resource[:key]) != nil
  end

  def create
    secedit(['/configure', '/db', dbfile, '/cfg', templatefile, '/log', logfile])
  end

  def destroy
    #
  end

  def value
    # get_domain_key_value(resource[:domain], resource[:key])
  end

  def value=(val)
    # defaults(['write', resource[:domain], resource[:key], val])
  end
end
