# V-73509
# Hardened UNC paths must be defined to require mutual authentication and integrity for at least the \\*\SYSVOL and \\*\NETLOGON shares.
class secure_windows::stig::v73509 (
  Boolean $enforced = false,
) {
  if $enforced {
    if($facts['windows_type'] =~ /(1|3|4|5)/) {
      # C:\Windows\system32\cmd.exe /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\SYSVOL" /d "RequireMutualAuthentication=1, RequireIntegrity=1" /t REG_SZ /f
      # NOTE: %ERRORLEVEL% returns 0 if match found and 1 if no match, so using unless param instead of onlyif param below...
      exec { 'v73509_netlogon':
        path    => 'C:\Windows\system32',
        command => 'cmd.exe /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\NETLOGON" /d "RequireMutualAuthentication=1, RequireIntegrity=1" /t REG_SZ /f',
        unless  => 'cmd.exe /C reg query HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\NETLOGON"',
      }

      exec { 'v73509_sysvol':
        path    => 'C:\Windows\system32',
        command => 'cmd.exe /C reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\SYSVOL" /d "RequireMutualAuthentication=1, RequireIntegrity=1" /t REG_SZ /f',
        unless  => 'cmd.exe /C reg query HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths /v "\\*\SYSVOL"',
      }
    }
  }
}
