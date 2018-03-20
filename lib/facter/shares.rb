Facter.add('shares') do
  confine operatingsystem: :windows
  setcode do
    shares_hash = {}

    result = Facter::Core::Execution.execute('net share').split(%r{\r\n})[3..-2]

    result.each do |line|
      entry = %r{(\S+)\s+(\w:\S+)}.match(line.strip)

      if entry
        shares_hash[entry[1]] = entry[2].tr('\\', '/')
      end
    end

    shares_hash
  end
end
