# V-73551
# Windows Telemetry must be configured to Security or Basic.
class secure_windows::stig::v73551 (
  Boolean $enforced = false,
) {

  if $enforced {

    registry::value { 'v73551':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection',
      value => 'AllowTelemetry',
      type  => 'dword',
      data  => '0x00000000',
    }

  }

}
