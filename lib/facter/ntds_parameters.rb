Facter.add('ntds_parameters') do
  confine operatingsystem: :windows
  setcode do
    require 'win32/registry'
    ntds_hash = {}

    begin
      reg_values = Win32::Registry::HKEY_LOCAL_MACHINE.open 'SYSTEM\CurrentControlSet\Services\NTDS\Parameters', Win32::Registry::KEY_READ
      reg_values.each do |key, _v|
        ntds_hash[key] = if reg_values[key].is_a?(String)
                           reg_values[key].tr('\\', '/')
                         else
                           reg_values[key]
                         end
      end
    rescue StandardError => e
      Puppet.debug "Facter: ntds_parameters.rb error occurred: #{e}"
    end

    ntds_hash
  end
end
