# This class manages V-3381
# The system must be configured to the required LDAP client signing level.
class secure_windows::stig::v3381 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v3381':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LDAP',
      value => 'LDAPClientIntegrity',
      type  => 'dword',
      data  => '1',
    }
  }
}
