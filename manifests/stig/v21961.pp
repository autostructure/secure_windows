# This class manages V-21961
# All Direct Access traffic must be routed through the internal network.
class secure_windows::stig::v21961 (
  Boolean $enforced = true,
) {

  if $enforced {

    registry::value { 'v21961':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\TCPIP\v6Transition',
      value => 'Force_Tunneling',
      type  => 'string',
      data  => 'enabled',
    }

  }

}
