
# policy_template_file_manager.rb
#
# secedit /configure /db FileName [/cfg FileName ] [/overwrite][/areas area1 area2...] [/log FileName] [/quiet]
# %windir%\security\database directory (where %windir% is the drive and path to your Windows directory).
# secedit /configure /db mysecure.sdb /areas FILESTORE /log %windir% \security\logs\Mysecure.log /verbose.

dbfile = 'c:\Windows\security\database\secedit.sdb'
admintemplatefile = 'MSS-Legacy.admx' # MSS-Legacy.admx, MSS-Legacy.adml
logfile = "c:\\puppet-secedit.log"
cmdline = "secedit /configure /db #{dbfile} /cfg #{admintemplatefile} /overwrite /log #{logfile}"
Facter::Core::Execution.exec(cmdline)
