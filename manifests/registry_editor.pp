#
# This class uses a puppet forge module to make changes
# to the Windows Registry in support of DoD hardening.
#
# TODO:
# - Add unit testing
# - Consider adding custom warning log/sysout messages
#
class secure_windows::registry_editor {

  ::secure_windows::log { 'Begin editing registry...': }

  # V-73487
  registry::value { 'v73487':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI',
    value => 'EnumerateAdministrators',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73493':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization',
    value => 'NoLockScreenSlideshow',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73495':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'LocalAccountTokenFilterPolicy',
    type  => 'dword',
    data  => '0x00000000',
  }

  # This policy setting requires the installation of the SecGuide custom templates
  # included with the STIG package. "SecGuide.admx" and " SecGuide.adml"
  # must be copied to the \Windows\PolicyDefinitions and
  # \Windows\PolicyDefinitions\en-US directories respectively.
  registry::value { 'v73497':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest',
    value => 'UseLogonCredential',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73499':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters',
    value => 'DisableIPSourceRouting',
    type  => 'dword',
    data  => '0x00000002',
  }

  # TODO: Install the MSS-Legacy custom templates included in the STIG package.
  # This policy setting requires the installation of the
  # MSS-Legacy custom templates included with the STIG package.
  # "MSS-Legacy.admx" and "MSS-Legacy.adml" must be copied to the
  # \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US
  # directories respectively.
  registry::value { 'v73501':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    value => 'DisableIPSourceRouting',
    type  => 'dword',
    data  => '0x00000002',
  }

  # TODO: Install the MSS-Legacy custom templates included in the STIG package.
  registry::value { 'v73503':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters',
    value => 'EnableICMPRedirect',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73505':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netbt\Parameters',
    value => 'NoNameReleaseOnDemand',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73507':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation',
    value => 'AllowInsecureGuestAuth',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73509-1':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths',
    value => "\\\\\*\\NETLOGON",
    type  => 'string',
    data  => 'RequireMutualAuthentication=1, RequireIntegrity=1',
  }

  registry::value { 'v73509-2':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths',
    value => "\\\\\*\\SYSVOL",
    type  => 'string',
    data  => 'RequireMutualAuthentication=1, RequireIntegrity=1',
  }

  registry::value { 'v73511':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit',
    value => 'ProcessCreationIncludeCmdLine_Enabled',
    type  => 'dword',
    data  => '0x00000001',
  }

  # TODO: other steps to complete.
  registry::value { 'v73513-1':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
    value => 'EnableVirtualizationBasedSecurity',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73513-2':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
    value => 'RequirePlatformSecurityFeatures',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73515':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
    value => 'LsaCfgFlags',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73517':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard',
    value => 'HypervisorEnforcedCodeIntegrity',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73521':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Policies\EarlyLaunch',
    value => 'DriverLoadPolicy',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73525':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}',
    value => 'NoGPOListChanges',
    type  => 'dword',
    data  => '0x00000000',
  }

  ::secure_windows::log {'Registry editing complete.': }

}
