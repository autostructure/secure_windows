# This class manages V-26575
# The 6to4 IPv6 transition technology must be disabled.

class secure_windows::stig::v26575 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26575':
        key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\TCPIP\v6Transition',
        value => '6to4_State',
        type  => 'string',
        data  => 'Disabled',
      }

    }

  }
