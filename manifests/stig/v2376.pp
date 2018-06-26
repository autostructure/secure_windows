# This class manages V-2376
# Kerberos user logon restrictions must be enforced.
# V-2377
# The Kerberos service ticket maximum lifetime must be limited to 600 minutes or less.
# V-2378
# The Kerberos user ticket lifetime must be limited to 10 hours or less.
# V-2379
# The Kerberos policy user ticket renewal maximum lifetime must be limited to 7 days or less.

class secure_windows::stig::v2376 (
  Boolean $enforced = true,
) {

  if $enforced {
    $domain = $facts['domain']

    if($facts['windows_server_type'] == 'windowsdc') {
      file { "C:\\Windows\\SYSVOL\\sysvol\\${domain}\\Policies\\{31B2F340-016D-11D2-945F-00C04FB984F9}\\MACHINE\\Microsoft\\Windows NT\\SecEdit\\GptTmpl.inf": # lint:ignore:140chars
        ensure => file,
        source => 'puppet:///modules/secure_windows/stig/v2376/GptTmpl.inf',
      }
    }
  }
}
