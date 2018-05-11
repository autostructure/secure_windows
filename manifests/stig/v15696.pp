# This class manages V-15696
# The Mapper I/O network protocol (LLTDIO) driver allows the discovery of the connected network and allows various options to be enabled.
# Disabling this helps protect the system from potentially discovering and connecting to unauthorized devices.
class secure_windows::stig::v15696 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15696-1':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LLTD',
      value => 'AllowLLTDIOOndomain',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15696-2':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LLTD',
      value => 'AllowLLTDIOOnPublicNet',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15696-3':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LLTD',
      value => 'EnableLLTDIO',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15696-4':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\LLTD',
      value => 'ProhibitLLTDIOOnPrivateNet',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
