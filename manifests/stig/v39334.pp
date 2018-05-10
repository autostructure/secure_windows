# This class manages V-39334
# Domain controllers must have a PKI server certificate.
class secure_windows::stig::v39334 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      if ($facts['pki_certs'] == 'no certs') {
        notify { 'v39334':
          message  => 'Not in compliance with DoD STIG V-39334. The Domain Controller does not have a PKI server certificate.',
          loglevel => warning,
        }
      }
    }
  }
}
