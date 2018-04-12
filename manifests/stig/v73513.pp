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
      notify {"facts['credential_guard_requiredsecurityproperties'] = ${facts['credential_guard_requiredsecurityproperties']}": }
    } else {
      notify {"secure_windows: skipping v-73513, only relevant on Windows Server 2016, operating system (${facts['operatingsystemmajrelease']}) detected.": }
    }
  }

}
