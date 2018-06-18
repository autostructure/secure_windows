# This class manages V-3472
# If the time service is configured, it must use an authorized time server.

class secure_windows::stig::v3472 (
  Boolean $enforced = true,
  String $ntp_server = 'pool.ntp.org',
) {
  if $enforced {
    registry::value { 'v3472':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\W32time\Parameters',
      value => 'NTP',
      type  => 'string',
      data  => $ntp_server,
    }

  }
}
