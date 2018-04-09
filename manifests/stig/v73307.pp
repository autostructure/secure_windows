# This class manages V-73307
# The time service must synchronize with an appropriate DoD time source.
#
# TODO:
# - Parameterize for time servers
class secure_windows::stig::v73307 (
  Boolean $enforced = false,
) {

  if $enforced {
    if $facts['windows_type'] =~ /(1|3|4|5)/ {
      # Domain-Joined Systems
      if $facts['fqdn'] == $facts['pdc_emulator_role'] {
        # PDC Emulator Role should sync with a DoD time source
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
      else {
        # Domain Members, not the PDC, should sync with the PDC using NT5DS
        registry::value { 'v73307 Type':
          key    => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32time\Parameters',
          value  => 'Type',
          type   => 'string',
          data   => 'NT5DS',
          notify => Service['w32time'],
        }
      }
    }
    else {
      # Standalone Servers should sync with a DoD time source
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

}
