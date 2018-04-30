# This class manages V-73237
# Domain-joined systems must have a Trusted Platform Module (TPM) enabled and ready for use.
class secure_windows::stig::v73237 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_type'] =~ /(1|3|4|5)/ {
      if $facts['tpm_version'] == 'TPM not enabled' {
        notify { 'v73237':
          message  => 'Not in compliance with DoD STIG V-73237. TPM is not enabled.',
          loglevel => warning,
        }
      }
    }
  }
}
