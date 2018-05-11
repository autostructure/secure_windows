# This class manages V-4408
# Domain controllers must be configured to allow reset of machine account passwords.
class secure_windows::stig::v4408 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      registry::value { 'v4408':
        key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters',
        value => 'RefusePasswordChange',
        type  => 'dword',
        data  => '0x00000000',
      }
    }
  }
}
