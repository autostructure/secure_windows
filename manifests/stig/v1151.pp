# This class manages V-1151
# The print driver installation privilege must be restricted to administrators

class secure_windows::stig::v1151 (
  Boolean $enforced = true,
) {
  if $enforced {
    registry::value { 'v1151':
      key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers',
      value => 'AddPrinterDrivers',
      type  => 'dword',
      data  => '1',
    }

  }
}
