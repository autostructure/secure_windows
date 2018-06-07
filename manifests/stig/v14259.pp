#This class manages V-14259
#Printing over HTTP must be prevented.
class secure_windows::stig::v14259 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Printers\DisableHTTPPrinting':
      ensure => present,
      type   => 'dword',
      data   => '0x00000001',
    }
  }
}
