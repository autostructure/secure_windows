# Profile class for AppLocker configuration.
#

class secure_windows::applocker_startup {

  # Must enable access to powershell.exe since it is used by the applocker_rule provider to enforce rules.
  #

  applocker_rule { '(Puppet Rule) Allow Puppet to run powershell.exe (the applocker_rule provider).':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '%SYSTEM32%\WindowsPowerShell\v1.0\powershell.exe'
    }],
    description       => 'Allow Administrator to execute %SYSTEM32%\WindowsPowerShell\v1.0\powershell.exe',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Exe',
    user_or_group_sid => 'S-1-5-32-544',
  }

  # Create AppLocker "Default Rules" before starting the AppIDSvc service.
  #

  applocker_rule { '(Default Rule) All Windows Installer files':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '*.*'
    }],
    description       => 'Allows members of the local Administrators group to run all Windows Installer files.',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Msi',
    user_or_group_sid => 'S-1-5-32-544',
  }

  applocker_rule { '(Default Rule) All Windows Installer files in %systemdrive%\Windows\Installer':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '%WINDIR%\Installer\*'
    }],
    description       => 'Allows members of the Everyone group to run all Windows Installer files located in %systemdrive%\Windows\Installer.',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Msi',
    user_or_group_sid => 'S-1-1-0',
  }

  applocker_rule { '(Default Rule) All digitally signed Windows Installer files':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'publisher'  => '*',
      'product'    => '*',
      'binaryname' => '*',
      'hi_version' => '*',
      'lo_version' => '0.0.0.0'
    }],
    description       => 'Allows members of the Everyone group to run digitally signed Windows Installer files.',
    mode              => 'NotConfigured',
    rule_type         => 'publisher',
    type              => 'Msi',
    user_or_group_sid => 'S-1-1-0',
  }

  applocker_rule { '(Default Rule) All files':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '*'
    }],
    description       => 'Allows members of the local Administrators group to run all applications.',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Exe',
    user_or_group_sid => 'S-1-5-32-544',
  }

  applocker_rule { '(Default Rule) All files located in the Program Files folder':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '%PROGRAMFILES%\*'
    }],
    description       => 'Allows members of the Everyone group to run applications that are located in the Program Files folder.',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Exe',
    user_or_group_sid => 'S-1-1-0',
  }

  applocker_rule { '(Default Rule) All files located in the Windows folder':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '%WINDIR%\*'
    }],
    description       => 'Allows members of the Everyone group to run applications that are located in the Windows folder.',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Exe',
    user_or_group_sid => 'S-1-1-0',
  }

  applocker_rule { '(Default Rule) All scripts':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '*'
    }],
    description       => 'Allows members of the local Administrators group to run all scripts.',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Script',
    user_or_group_sid => 'S-1-5-32-544',
  }

  applocker_rule { '(Default Rule) All scripts located in the Program Files folder':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '%PROGRAMFILES%\*'
    }],
    description       => 'Allows members of the Everyone group to run scripts that are located in the Program Files folder.',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Script',
    user_or_group_sid => 'S-1-1-0',
  }

  applocker_rule { '(Default Rule) All scripts located in the Windows folder':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'path' => '%WINDIR%\*'
    }],
    description       => 'Allows members of the Everyone group to run scripts that are located in the Windows folder.',
    mode              => 'NotConfigured',
    rule_type         => 'path',
    type              => 'Script',
    user_or_group_sid => 'S-1-1-0',
  }

  applocker_rule { '(Default Rule) All signed packaged apps':
    ensure            => 'present',
    action            => 'Allow',
    conditions        => [
    {
      'publisher'  => '*',
      'product'    => '*',
      'binaryname' => '*',
      'hi_version' => '*',
      'lo_version' => '0.0.0.0'
    }],
    description       => 'Allows members of the Everyone group to run packaged apps that are signed.',
    mode              => 'NotConfigured',
    rule_type         => 'publisher',
    type              => 'Appx',
    user_or_group_sid => 'S-1-1-0',
  }

  # V-73235
  # AppLocker is deny-all inherently when the AppIDSvc is started.
  #
  # AppLockerPolicy requires this service is running to enforce AppLocker policies.
  #

  service { 'application identity service':
    ensure => running,
    name   => 'AppIDSvc',
    enable => true,
  }

}
