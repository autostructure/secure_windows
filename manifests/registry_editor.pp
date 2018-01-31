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

  # TODO: value should be...
  #  value => '\\*\NETLOGON',
  # Since this requirement relates to UNC Paths, I choose to use
  # forward slashes instead of backslashes.  I wonder if the STIG
  # mis-reported this req because I can't even manually adding
  # a registry key with backslashes.
  # echo %comspec%
  # C:\Windows\system32\cmd.exe
  # %COMSPEC% /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\SYSVOL" /d "RequireMutualAuthentication=0" /t REG_SZ
  # %COMSPEC% /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\NETLOGON" /d "RequireMutualAuthentication=0" /t REG_SZ
  # Source: https://serverfault.com/questions/754012/windows-10-unable-to-access-sysvol-and-netlogon
  # New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Name "\\*\SYSVOL" -Value "RequireMutualAuthentication=0" -Property "String"
  # New-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths" -Name "\\*\NETLOGON" -Value "RequireMutualAuthentication=0" -Property "String"
  # Source: https://community.spiceworks.com/topic/1389891-windows-10-and-sysvol-netlogon
  #registry::value { 'v73509-1':
  #  key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths',
  #  value => '\\*\NETLOGON',
  #  type  => 'string',
  #  data  => 'RequireMutualAuthentication=1, RequireIntegrity=1',
  #}
  #
  # TODO: value should be...
  #  value => '\\*\SYSVOL',
  #registry::value { 'v73509-2':
  #  key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths',
  #  value => '\\*\SYSVOL',
  #  type  => 'string',
  #  data  => 'RequireMutualAuthentication=1, RequireIntegrity=1',
  #}

  # C:\Windows\system32\cmd.exe /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\SYSVOL" /d "RequireMutualAuthentication=1, RequireIntegrity=1" /t REG_SZ /f
  exec { 'v73509_netlogon':
    command => 'C:\Windows\system32\cmd.exe /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\NETLOGON" /d "RequireMutualAuthentication=1, RequireIntegrity=1" /t REG_SZ /f',
  }

  exec { 'v73509_sysvol':
    command => 'C:\Windows\system32\cmd.exe /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\SYSVOL" /d "RequireMutualAuthentication=1, RequireIntegrity=1" /t REG_SZ /f',
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

  registry::value { 'v73527':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers',
    value => 'DisableWebPnPDownload',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73529':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Printers',
    value => 'DisableHTTPPrinting',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73531':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
    value => 'DontDisplayNetworkSelectionUI',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73533':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
    value => 'EnumerateLocalUsers',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73535':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\MitigationOption',
    value => 'MitigationOptions_FontBocking',
    type  => 'string',
    data  => '1000000000000',
  }

  registry::value { 'v73537':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51',
    value => 'DCSettingIndex',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73539':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51',
    value => 'ACSettingIndex',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73541':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc',
    value => 'RestrictRemoteClients',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73543':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat',
    value => 'DisableInventory',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73545':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
    value => 'NoAutoplayfornonVolume',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73547':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer',
    value => 'NoAutorun',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73549':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer',
    value => 'NoDriveTypeAutoRun',
    type  => 'dword',
    data  => '0x000000ff',
  }

  registry::value { 'v73551':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection',
    value => 'AllowTelemetry',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73553':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application',
    value => 'MaxSize',
    type  => 'dword',
    data  => '0x00008000',
  }

  registry::value { 'v73555':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security',
    value => 'MaxSize',
    type  => 'dword',
    data  => '0x00030000',
  }

  registry::value { 'v73557':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\System',
    value => 'MaxSize',
    type  => 'dword',
    data  => '0x00008000',
  }

  registry::value { 'v73559':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System',
    value => 'EnableSmartScreen',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73561':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
    value => 'NoDataExecutionPrevention',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73563':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer',
    value => 'NoHeapTerminationOnCorruption',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73565':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer',
    value => 'PreXPSP2ShellProtocolBehavior',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73567':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    value => 'DisablePasswordSaving',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73569':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    value => 'fDisableCdm',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73571':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    value => 'fPromptForPassword',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73573':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    value => 'fEncryptRPCTraffic',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73575':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services',
    value => 'MinEncryptionLevel',
    type  => 'dword',
    data  => '0x00000003',
  }

  registry::value { 'v73577':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds',
    value => 'DisableEnclosureDownload',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73579':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds',
    value => 'AllowBasicAuthInClear',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73581':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search',
    value => 'AllowIndexingEncryptedStoresOrItems',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73583':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
    value => 'EnableUserControl',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73585':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
    value => 'AlwaysInstallElevated',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73587':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Installer',
    value => 'SafeForScripting',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73589':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'DisableAutomaticRestartSignOn',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73591':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging',
    value => 'EnableScriptBlockLogging',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73593':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
    value => 'AllowBasic',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73595':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
    value => 'AllowUnencryptedTraffic',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73597':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client',
    value => 'AllowDigest',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73599':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
    value => 'AllowBasic',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73601':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
    value => 'AllowUnencryptedTraffic',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73603':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service',
    value => 'DisableRunAs',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73621':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'LimitBlankPasswordUse',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73627':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'SCENoApplyLegacyAuditPolicy',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73629':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NTDS\Parameters',
    value => 'LDAPServerIntegrity',
    type  => 'dword',
    data  => '0x00000002',
  }

  registry::value { 'v73631':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'RefusePasswordChange',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73633':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'RequireSignOrSeal',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73635':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'SealSecureChannel',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73637':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'SignSecureChannel',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73639':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'DisablePasswordChange',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73641':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'MaximumPasswordAge',
    type  => 'dword',
    data  => '0x0000001e',
  }

  registry::value { 'v73643':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters',
    value => 'RequireStrongKey',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73645':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'InactivityTimeoutSecs',
    type  => 'dword',
    data  => '0x00000384',
  }

  $legalnoticetext = "You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.

By using this IS (which includes any device attached to this IS), you consent to the following conditions:

-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations.

-At any time, the USG may inspect and seize data stored on this IS.

-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.

-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.

-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details.

Any OS versions that do not support the full text version must state the following:
\"I've read & consent to terms in IS user agreem't.\"

Deviations are not permitted except as authorized by the Deputy Assistant Secretary of Defense for Information and Identity Assurance."

  registry::value { 'v73647':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'LegalNoticeText',
    type  => 'string',
    data  => $legalnoticetext,
  }

  $legalnoticetitle = 'US Department of Defense Warning Statement'
  # Alternatively, the title below is also valid...
  # $legalnoticetitle = "DoD Notice and Consent Banner",

  registry::value { 'v73649':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'LegalNoticeCaption',
    type  => 'string',
    data  => $legalnoticetitle,
  }

  registry::value { 'v73651':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'CachedLogonsCount',
    type  => 'string',
    data  => '4',
  }

  registry::value { 'v73653':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
    value => 'RequireSecuritySignature',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73655':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
    value => 'EnableSecuritySignature',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73657':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters',
    value => 'EnablePlainTextPassword',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73659':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters',
    value => 'autodisconnect',
    type  => 'dword',
    data  => '0x0000000f',
  }

  registry::value { 'v73661':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters',
    value => 'RequireSecuritySignature',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73663':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters',
    value => 'EnableSecuritySignature',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73667':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'RestrictAnonymousSAM',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73669':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'RestrictAnonymous',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73671':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'DisableDomainCreds',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73673':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'EveryoneIncludesAnonymous',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73675':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanManServer\Parameter',
    value => 'RestrictNullSessAccess',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73677':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'RestrictRemoteSAM',
    type  => 'string',
    data  => 'O:BAG:BAD:(A;;RC;;;BA)',
  }

  registry::value { 'v73679':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'UseMachineId',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73681':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
    value => 'allownullsessionfallback',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73683':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\pku2u',
    value => 'AllowOnlineID',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73685':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters',
    value => 'SupportedEncryptionTypes',
    type  => 'dword',
    data  => '0x7ffffff8',
  }

  registry::value { 'v73687':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'NoLMHash',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73691':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'LmCompatibilityLevel',
    type  => 'dword',
    data  => '0x00000005',
  }

  registry::value { 'v73693':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LDAP',
    value => 'LDAPClientIntegrity',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73695':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
    value => 'NTLMMinClientSec',
    type  => 'dword',
    data  => '0x20080000',
  }

  registry::value { 'v73697':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0',
    value => 'NTLMMinServerSec',
    type  => 'dword',
    data  => '0x20080000',
  }

  registry::value { 'v73699':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cryptography',
    value => 'ForceKeyProtection',
    type  => 'dword',
    data  => '0x00000002',
  }

  registry::value { 'v73701':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\FIPSAlgorithmPolicy',
    value => 'Enabled',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73703':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel',
    value => 'ObCaseInsensitive',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73705':
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager',
    value => 'ProtectionMode',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73707':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'FilterAdministratorToken',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73709':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableUIADesktopToggle',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73711':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'ConsentPromptBehaviorAdmin',
    type  => 'dword',
    data  => '0x00000002',
  }

  registry::value { 'v73713':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'ConsentPromptBehaviorUser',
    type  => 'dword',
    data  => '0x00000000',
  }

  registry::value { 'v73715':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableInstallerDetection',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73717':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableSecureUIAPaths',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73719':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableLUA',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73721':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    value => 'EnableVirtualization',
    type  => 'dword',
    data  => '0x00000001',
  }

  registry::value { 'v73723':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop',
    value => 'ScreenSaveActive',
    type  => 'string',
    data  => '1',
  }

  registry::value { 'v73725':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop',
    value => 'ScreenSaverIsSecure',
    type  => 'string',
    data  => '1',
  }

  registry::value { 'v73727':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments',
    value => 'SaveZoneInformation',
    type  => 'dword',
    data  => '0x00000002',
  }

  registry::value { 'v73807':
    key   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon',
    value => 'scremoveoption',
    type  => 'string',
    data  => '1',
  }

  ::secure_windows::log {'Registry editing complete.': }

}
