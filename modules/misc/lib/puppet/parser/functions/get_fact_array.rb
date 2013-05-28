module Puppet::Parser::Functions
  newfunction(:get_fact_array, :type => :rvalue) do |args|
    eval(args[0])[args[1]].to_a
  end
end
