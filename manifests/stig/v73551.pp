# V-73551
# Windows Telemetry must be configured to Security or Basic.
class secure_windows::stig::v73551 (
  Boolean $enforced = false,
  Enum['security','basic'] $allowtelemetry = 'security'
) {

  if $enforced {

    $allowtelemetryvalue = $allowtelemetry ? {
      'security' => '0x00000000',
      'basic'    => '0x00000001',
    }

    registry::value { 'v73551':
      key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection',
      value => 'AllowTelemetry',
      type  => 'dword',
      data  => $allowtelemetryvalue,
    }

  }

}
