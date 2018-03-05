require 'win32/registry'

Facter.add('ntds_parameters') do
  #confine kernel: 'windows'
  confine :osfamily => "Windows"

  setcode do
    ntds_hash = {}

    reg_values = Win32::Registry::HKEY_LOCAL_MACHINE.open 'SYSTEM\CurrentControlSet\Services\NTDS\Parameters', Win32::Registry::KEY_READ

    reg_values.each do |key, _v|
      ntds_hash[key] = if reg_values[key].is_a?(String)
                         reg_values[key].tr('\\', '/')
                       else
                         reg_values[key]
                       end
    end

    ntds_hash
  end
end
