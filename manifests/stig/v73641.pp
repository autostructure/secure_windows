# V-73641
# The maximum age for machine account passwords must be configured to 30 days or less.
class secure_windows::stig::v73641 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73641':
      key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
      value => 'MaximumPasswordAge',
      type  => 'dword',
      data  => '0x0000001e',
    }

  }

}
