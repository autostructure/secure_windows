# V-73513
# Virtualization-based security must be enabled with the platform security level configured to Secure Boot or Secure Boot with DMA Protection.
class secure_windows::stig::v73513 (
  Boolean $enforced = false,
) {

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
  # A Microsoft TechNet article on Credential Guard, including system requirement details, can be found at the following link:
  # https://technet.microsoft.com/itpro/windows/keep-secure/credential-guard

  if $enforced {

    # Windows Defender Credential Guard only supported on:
    # Windows Server 2016 & Windows 10

    if $facts['operatingsystemmajrelease'] in ['2016','2016 R2'] {

      test1 = $facts['credential_guard_requiredsecurityproperties'].include? '2'
      test1 = $facts['credential_guard_virtualizationbasedsecuritystatus'] == '2'

      notify {"facts['credential_guard_requiredsecurityproperties'] = ${facts['credential_guard_requiredsecurityproperties']}": }
      notify {"facts['credential_guard_requiredsecurityproperties'].include? '2' = ${test1}": }

      notify {"facts['credential_guard_virtualizationbasedsecuritystatus'] = ${facts['credential_guard_credential_guard_virtualizationbasedsecuritystatus']}": }
      notify {"facts['credential_guard_virtualizationbasedsecuritystatus'] == '2' = ${test2}": }

        if $facts['credential_guard_requiredsecurityproperties'].include? '2'  && $facts['credential_guard_virtualizationbasedsecuritystatus'] == '2'
          # good
          notify {"Credential Guard Check Okay.": }
        } else {
          # bad
          notify {"Credential Guard Check Fail.": }
        }


      } else {
        notify {"secure_windows: skipping v-73513, only relevant on Windows Server 2016, operating system (${facts['operatingsystemmajrelease']}) detected.": }
      }

  }

}
