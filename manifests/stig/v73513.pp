# V-73513
# Virtualization-based security must be enabled with the platform security level configured to Secure Boot or Secure Boot with DMA Protection.
class secure_windows::stig::v73513 (
  Boolean $enforced = false,
) {

  # powershell fact commands...
  # Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard | select RequiredSecurityProperties | FT -HideTableHeaders
  # Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard | select VirtualizationBasedSecurityStatus | FT -HideTableHeaders

  # TODO: other steps to complete.
  # For more information on Credential Guard, see:
  # https://technet.microsoft.com/itpro/windows/keep-secure/credential-guard

  # Fix Text
  # ========
  # Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Device Guard >> "Turn On Virtualization Based Security" to "Enabled" with "Secure Boot" or "Secure Boot and DMA Protection" selected.
  #
  # A Microsoft TechNet article on Credential Guard, including system requirement details, can be found at the following link:
  # https://technet.microsoft.com/itpro/windows/keep-secure/credential-guard

  # Check Content
  # =============
  # For standalone systems, this is NA.
  # Current hardware and virtual environments may not support virtualization-based security features, including Credential Guard, due to specific supporting requirements, including a TPM, UEFI with Secure Boot, and the capability to run the Hyper-V feature within a virtual machine.
  # Open "PowerShell" with elevated privileges (run as administrator).
  # Enter the following:
  #
  # "Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard"
  #
  # e.g.
  # PS > Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard
  #
  # AvailableSecurityProperties                  : {3}
  # CodeIntegrityPolicyEnforcementStatus         : 0
  # InstanceIdentifier                           : 4ff40742-2649-41b8-bdd1-e80fad1cce80
  # RequiredSecurityProperties                   : {1, 2}
  # SecurityServicesConfigured                   : {1, 2}
  # SecurityServicesRunning                      : {0}
  # UsermodeCodeIntegrityPolicyEnforcementStatus : 0
  # Version                                      : 1.0
  # VirtualizationBasedSecurityStatus            : 1
  # PSComputerName                               :
  #
  # PS > Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard | select RequiredSecurityProperties | FT -HideTableHeaders
  #
  # {1, 2}
  #
  # If "RequiredSecurityProperties" does not include a value of "2" indicating "Secure Boot" (e.g., "{1, 2}"), this is a finding.
  #
  # If "Secure Boot and DMA Protection" is configured, "3" will also be displayed in the results (e.g., "{1, 2, 3}").
  #
  # If "VirtualizationBasedSecurityStatus" is not a value of "2" indicating "Running", this is a finding.
  #
  # Alternately:
  # ------------
  # Run "System Information".
  #
  # Under "System Summary", verify the following:
  #
  # If "Device Guard Virtualization based security" does not display "Running", this is finding.
  #
  # If "Device Guard Required Security Properties" does not display "Base Virtualization Support, Secure Boot", this is finding.
  #
  # If "Secure Boot and DMA Protection" is configured, "DMA Protection" will also be displayed (e.g., "Base Virtualization Support, Secure Boot, DMA Protection").
  #
  # The policy settings referenced in the Fix section will configure the following registry values. However, due to hardware requirements, the registry values alone do not ensure proper function.
  #
  # Registry Hive: HKEY_LOCAL_MACHINE
  # Registry Path: \SOFTWARE\Policies\Microsoft\Windows\DeviceGuard\
  #
  # Value Name: EnableVirtualizationBasedSecurity
  # Value Type: REG_DWORD
  # Value: 0x00000001 (1)
  #
  # Value Name: RequirePlatformSecurityFeatures
  # Value Type: REG_DWORD
  # Value: 0x00000001 (1) (Secure Boot only) or 0x00000003 (3) (Secure Boot and DMA Protection)
  #
  # A Microsoft TechNet article on Credential Guard, including system requirement details, can be found at the following link:
  # https://technet.microsoft.com/itpro/windows/keep-secure/credential-guard

  if $enforced {

    # Windows Defender Credential Guard only supported on:
    # Windows Server 2016 & Windows 10

    if $facts['operatingsystemmajrelease'] in ['2016','2016 R2'] {

      notify {"facts['credential_guard_requiredsecurityproperties'] = ${facts['credential_guard_requiredsecurityproperties']}": }
      notify {"facts['credential_guard_requiredsecurityproperties'].include? '2' = ${facts['credential_guard_requiredsecurityproperties'].include? '2'}": }
      notify {"facts['credential_guard_virtualizationbasedsecuritystatus'] = ${facts['credential_guard_credential_guard_virtualizationbasedsecuritystatus']}": }
      notify {"facts['credential_guard_virtualizationbasedsecuritystatus'] == '2' = ${facts['credential_guard_virtualizationbasedsecuritystatus'] == '2'}": }

        if $facts['credential_guard_requiredsecurityproperties'].include? '2'  && $facts['credential_guard_virtualizationbasedsecuritystatus'] == '2'
          # good
          notify {"Credential Guard Okay.": }
        } else {
          # bad
          notify {"Credential Guard Fail.": }
        }


      } else {
        notify {"secure_windows: skipping v-73513, only relevant on Windows Server 2016, operating system (${facts['operatingsystemmajrelease']}) detected.": }
      }

  }

}
