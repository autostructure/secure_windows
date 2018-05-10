# This class manages V-40204
# Only the default client printer must be redirected to the Remote Desktop Session Host. (Remote Desktop Services Role).
class secure_windows::stig::v40204 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v40204':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows NT\Terminal Services',
      value => 'RedirectOnlyDefaultClientPrinter',
      type  => 'dword',
      data  => '0x00000001',
    }
  }
}
