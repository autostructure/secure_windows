# V-73643
# Windows Server 2016 must be configured to require a strong session key.
class secure_windows::stig::v73643 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73643':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'RequireStrongKey',
      type  => 'dword',
      data  => '0x00000001',
    }

  }

}
