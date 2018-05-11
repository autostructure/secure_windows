# This class manages V-15697
# The Responder network protocol driver allows a computer to be discovered and located on a network.
# Disabling this helps protect the system from potentially being discovered and connected to by unauthorized devices.
class secure_windows::stig::v15697 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15697-1':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LLTD',
      value => 'AllowRspndrOndomain',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15697-2':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LLTD',
      value => 'AllowRspndrOnPublicNet',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15697-3':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LLTD',
      value => 'EnableRspndr',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15697-4':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LLTD',
      value => 'ProhibitRspndrOnPrivateNet',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
