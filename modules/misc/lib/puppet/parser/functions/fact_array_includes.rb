module Puppet::Parser::Functions
  newfunction(:fact_array_includes, :type => :rvalue) do |args|
    args[0].include?(args[1])
  end
end
