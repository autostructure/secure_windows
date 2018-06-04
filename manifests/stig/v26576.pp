# This class manages V-26576
# The IP-HTTPS IPv6 transition technology must be disabled.

class secure_windows::stig::v26576 (
  Boolean $enforced = true,
  ) {
    if $enforced {

      registry::value { 'v26576':
        key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\TCPIP\v6Transition\IPHTTPS\IPHTTPSInterface',
        value => 'IPHTTPS_ClientState',
        type  => 'dword',
        data  => '3',
      }

    }

  }
