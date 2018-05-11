# This class manages V-4407
# Domain controllers must require LDAP access signing.
class secure_windows::stig::v4407 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      registry::value { 'v4407':
        key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters',
        value => 'LDAPServerIntegrity',
        type  => 'dword',
        data  => '0x00000002',
      }
    }
  }
}
