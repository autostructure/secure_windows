# V-73513
# Virtualization-based security must be enabled with the platform security level configured to Secure Boot or Secure Boot with DMA Protection.
#
class secure_windows::stig::v73513 (
  Boolean $enforced = false,
) {

  if $enforced {

    # Windows Defender Credential Guard only supported on:
    # Windows Server 2016 & Windows 10
    if $facts['operatingsystemmajrelease'] in ['2012 R2','2016','2016 R2'] {

      $passed_test_1 = $facts['credential_guard_requiredsecurityproperties'] ? {
        'secure boot'                    => true,
        'secure boot and dma protection' => true,
        default                          => false,
      }

      $passed_test_2 = $facts['credential_guard_virtualizationbasedsecuritystatus'] ? {
        'running' => true,
        default   => false,
      }

      if $passed_test_1 and $passed_test_2 {
        notify {'STIG vulnerability V-73513: Windows Credential Guard is running.': }
      } else {
        $msg = "Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Device Guard >> 'Turn On Virtualization Based Security' to 'Enabled' with 'Secure Boot' or 'Secure Boot and DMA Protection' selected."
        notify {"STIG finding for vulnerability V-73513: Windows Credential Guard is NOT running, fix instructions: ${msg}":
          loglevel => warning,
        }
      }

    } else {
      notify {"secure_windows: skipping v-73513, only relevant on Windows Server 2016, operating system (${facts['operatingsystemmajrelease']}) detected.": }
    }
  }

}
