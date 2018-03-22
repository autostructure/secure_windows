# This class manages GPOs
class secure_windows::gpo {

  # V-73359
  # Kerberos user logon restrictions must be enforced.


  # V-73361
  # The Kerberos service ticket maximum lifetime must be limited to 600 minutes or less.
  if($facts['windows_server_type'] == 'windowsdc') {
    # This messed it all up
    # file_line { 'serviceticketlifetime':
    #   ensure   => present,
    #   path     => 'C:\\Windows\\SYSVOL\\sysvol\\example.com\\Policies\\{31B2F340-016D-11D2-945F-00C04FB984F9}\\MACHINE\\Microsoft\\Windows NT\\SecEdit\\GptTmpl.inf',
    #   match    => '^MaxTicketAge',
    #   line     => 'MaxTicketAge = 11',
    #   encoding => 'Unicode',
    # }
    file { 'C:\\Windows\\SYSVOL\\sysvol\\example.com\\Policies\\{31B2F340-016D-11D2-945F-00C04FB984F9}\\MACHINE\\Microsoft\\Windows NT\\SecEdit\\GptTmpl.inf':
      ensure => file,
      source => 'puppet:///modules/secure_windows/GptTmpl.inf',
      notify => Exec['refresh group policy'],
    }
  }

  exec { 'refresh group policy':
    command     => 'C:\\Windows\\System32\\gpupdate.exe',
    refreshonly => true,
  }
  # V-73363
  # The Kerberos user ticket lifetime must be limited to 10 hours or less.


  # V-73365
  # The Kerberos policy user ticket renewal maximum lifetime must be limited to seven days or less.

}
