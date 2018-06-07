#This class manages V-14259
#Printing over HTTP must be prevented.
class secure_windows::stig::v14259 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v14259':
      key   => '\Software\Policies\Microsoft\Windows NT\Printers',
      value => 'DisableHTTPPrinting',
      type  => 'dword',
      data  => '0x00000001',
    }

  }
}
