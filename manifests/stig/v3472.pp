#klug
#KG

class secure_windows::stig::v3472 (
  Boolean $enforced = true,
  String $ntp_server = 'pool.ntp.org',
) {
  if $enforced {
    registry::value { 'v3472':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\W32time\Parameters',
      value => 'NTP',
      type  => 'String',
      data  => $ntp_server,
    }

  }
}
