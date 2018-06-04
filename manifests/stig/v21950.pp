#This class manages V-21950
#The service principal name (SPN) target name validation level must be turned off.
class secure_windows::stig::v21950 (
  Boolean $enforced = true,
) {
  if $enforced {

    registry_value { 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters\SmbServerNameHardeningLevel':
      ensure => present,
      type   => 'dword',
      data   => '0',
      }
    }
  }
