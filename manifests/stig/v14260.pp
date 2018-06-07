#This class manages V-14260
#Downloading print driver packages over HTTP must be prevented.
class secure_windows::stig::v14260 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\DisableWebPnPDownload':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
