# V-73631
# Domain controllers must be configured to allow reset of machine account passwords.
class secure_windows::stig::v73631 (
  Boolean $enforced = false,
) {

  if $enforced {
    if ($facts['windows_server_type'] == 'windowsdc') {
      registry::value { 'v73631':
        key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
        value => 'RefusePasswordChange',
        type  => 'dword',
        data  => '0x00000000',
      }
    }
  }

}
