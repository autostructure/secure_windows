
# policy_template_file_manager.rb
#
# secedit /configure /db FileName [/cfg FileName ] [/overwrite][/areas area1 area2...] [/log FileName] [/quiet]
# %windir%\security\database drectory (where %windir% is the drive and path to your Windows directory).
# secedit /configure /db mysecure.sdb /areas FILESTORE /log %windir% \security\logs\Mysecure.log /verbose.
Puppet::Type.type(:group_policy_template).provide(:secedit) do
  desc "Puppet custom type provider that loads Windows group policy templates."

  confine :osfamily => :windows
  defaultfor :operatingsystem => :windows
  confine :exists => "c:\\Windows\\security\\database\\secedit.sdb"
  commands :secedit => "secedit"

  dbfile = 'c:\Windows\security\database\secedit.sdb'
  templatefile = 'c:\tmp\MSS-Legacy.admx' # MSS-Legacy.admx, MSS-Legacy.adml
  logfile = 'c:\Windows\security\logs\puppet-secedit.log'
  _cmdline = "secedit /configure /db #{dbfile} /cfg #{templatefile} /log #{logfile}" # /overwrite ???

  # template path (property or param?)
  #def self.template_file_path
  #  templatefile
  #end

  # load policy template
  def load
    if File.exist?(dbfile) && File.exist?(templatefile)
      Facter::Core::Execution.exec(_cmdline)
    else
      raise Puppet::Error, "Failed to load policy template: #{_cmdline}"
    end
  end
end
