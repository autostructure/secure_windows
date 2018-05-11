# This class manages V-15698
# Windows Connect Now allows the discovery and configuration of devices over wireless. Wireless devices must be managed.
# If a rogue device is connected to a system, there is potential for sensitive information to be compromised.
class secure_windows::stig::v15698 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry::value { 'v15698-1':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WCN\Registrars',
      value => 'DisableFlashConfigRegistrar',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15698-2':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WCN\Registrars',
      value => 'DisableInBand802DOT11Registrar',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15698-3':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WCN\Registrars',
      value => 'DisableUPnPRegistrar',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15698-4':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WCN\Registrars',
      value => 'DisableWPDRegistrar',
      type  => 'dword',
      data  => '0x00000000',
    }

    registry::value { 'v15698-5':
      key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WCN\Registrars',
      value => 'EnableRegistrars',
      type  => 'dword',
      data  => '0x00000000',
    }

  }
}
