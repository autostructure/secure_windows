# This class manages V-26577
# The ISATAP IPv6 transition technology must be disabled.

class secure_windows::stig::v26577 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26577':
        key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\TCPIP\v6Transition',
        value => 'ISATAP_State',
        type  => 'string',
        data  => 'Disabled',
      }

    }

  }
