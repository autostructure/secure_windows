#
# This class manges time synchronization
#
# TODO:
# - Wow I'm an idiot and am glad I didn't commit this shit lol
#
class secure_windows::ntp {

  if $facts['windows_type'] =~ /(1|3|4|5)/ {
    # Domain-Joined Systems
    registry::value { 'v73307 Type':
      key    => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32time\Parameters',
      value  => 'Type',
      type   => 'string',
      data   => 'NT5DS',
      notify => Service['w32time'],
    }
  }
  else {
    # Standalone Servers
    registry::value { 'v73307 Type':
      key    => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32time\Parameters',
      value  => 'Type',
      type   => 'string',
      data   => 'NTP',
      notify => Service['w32time'],
    }
    registry::value { 'v73307 NtpServer':
      key    => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32time\Parameters',
      value  => 'NtpServer',
      type   => 'string',
      data   => 'tick.usno.navy.mil',
      notify => Service['w32time'],
    }
  }

  service { 'w32time':
    ensure => running,
    enable => true,
  }
}