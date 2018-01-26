
# policy_template_file_manager.rb
#
# secedit /configure /db FileName [/cfg FileName ] [/overwrite][/areas area1 area2...] [/log FileName] [/quiet]
# %windir%\security\database directory (where %windir% is the drive and path to your Windows directory).
# secedit /configure /db mysecure.sdb /areas FILESTORE /log %windir% \security\logs\Mysecure.log /verbose.
confine :osfamily => :windows
defaultfor :operatingsystem => :windows
confine :exists => "c:\\Windows\\security\\database\\secedit.sdb"
commands :secedit => "secedit"

Puppet::Type.type(:package).provide(:secedit) do
  desc "puppet windows provider that loads group policy templates."

  dbfile = 'c:\Windows\security\database\secedit.sdb'
  templatefile = 'MSS-Legacy.admx' # MSS-Legacy.admx, MSS-Legacy.adml
  logfile = 'c:\Windows\security\logs\puppet-secedit.log'
  _cmdline = "secedit /configure /db #{dbfile} /cfg #{templatefile} /log #{logfile}" # /overwrite ???

  # hard code the file path (this allows purging)
  def self.template_file_path
    templatefile
  end

  # load policy template
  def load
    if File.exist?(dbfile) && File.exist?(templatefile)
      Facter::Core::Execution.exec(_cmdline)
    else
      raise Puppet::Error, "Failed to load policy template: #{_cmdline}"
    end
  end

end
