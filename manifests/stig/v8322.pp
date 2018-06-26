# This class manages V-8322
# Time synchronization must be enabled on the domain controller.
class secure_windows::stig::v8322 (
  Boolean $enforced = true,
) {
  if $enforced {
    if $facts['windows_server_type'] == 'windowsdc' {
      registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient':
        ensure => present,
        type   => 'dword',
        data   => '0x00000001',
      }

      # registry::value { 'v8322-1':
      #   key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient',
      #   value => 'Enabled',
      #   type  => 'dword',
      #   data  => '0x00000001',
      # }
      registry::value { 'v8322-2':
        key   => 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\W32Time\Parameters',
        value => 'Type',
        type  => 'string',
        data  => 'NT5DS',
      }
    }
  }
}
