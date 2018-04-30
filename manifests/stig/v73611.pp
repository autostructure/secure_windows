# This class managed V-73611
# Domain controllers must have a PKI server certificate.
class secure_windows::stig::v73611 (
  Boolean $enforced = false,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      if ($facts['pki_certs'] == 'no certs') {
        notify { 'v73611':
          message  => 'Not in compliance with DoD STIG V-73611. The Domain Controller does not have a PKI server certificate.',
          loglevel => warning,
        }
      }
    }
  }
}
