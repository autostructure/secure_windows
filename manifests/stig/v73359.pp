# This class manages:
# V-73359
# Kerberos user logon restrictions must be enforced.
# V-73361
# The Kerberos service ticket maximum lifetime must be limited to 600 minutes or less.
# V-73363
# The Kerberos user ticket lifetime must be limited to 10 hours or less.
# V-73365
# The Kerberos policy user ticket renewal maximum lifetime must be limited to seven days or less.
#
# TODO:
# - Make sure that long folder ID is the same for all machines
#
class secure_windows::stig::v73359 (
  Boolean $enforced = false,
) {

  if $enforced {
    if($facts['windows_server_type'] == 'windowsdc') {
      file { 'C:\\Windows\\SYSVOL\\sysvol\\example.com\\Policies\\{31B2F340-016D-11D2-945F-00C04FB984F9}\\MACHINE\\Microsoft\\Windows NT\\SecEdit\\GptTmpl.inf':
        ensure => file,
        source => 'puppet:///modules/secure_windows/STIG/v73359/GptTmpl.inf',
      }
    }
  }

}
