module Puppet::Parser::Functions
  newfunction(:get_fact, :type => :rvalue) do |args|
    # parse string to ruby object and extract value
    eval(args[0])[args[1]].to_s
  end
end
