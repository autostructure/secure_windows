# This class manages V-26578
# The Teredo IPv6 transition technology must be disabled.

class secure_windows::stig::v26578 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26578':
        key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\TCPIP\v6Transition',
        value => 'Teredo_State',
        type  => 'string',
        data  => 'Disabled',
      }

    }

  }
