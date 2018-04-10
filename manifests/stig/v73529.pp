# V-73529
# Printing over HTTP must be prevented.
class secure_windows::stig::v73529 (
  Boolean $enforced = false,
) {
  if $enforced {

    registry::value { 'v73529':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers',
      value => 'DisableHTTPPrinting',
      type  => 'dword',
      data  => '0x00000001',
    }

}
