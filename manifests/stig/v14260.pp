#This class manages V-14260
#Downloading print driver packages over HTTP must be prevented.
class secure_windows::stig::v14260 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14260':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers',
      value => 'DisableWebPnPDownload',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
