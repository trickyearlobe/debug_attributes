
# Cookbook:: debug_attributes
# Library:: event_handler.rb
# Copyright:: 2020, The Authors, All Rights Reserved.

Chef::Log.warn '----------------------------------------------'
Chef::Log.warn '| Cookbook "debug_attributes"                |'
Chef::Log.warn '| Registering attribute event handler        |'
Chef::Log.warn '| This cookbook should not run in production |'
Chef::Log.warn '----------------------------------------------'

::Chef.event_handler do
  on :attribute_changed do |precedence, path, value|
    Chef::Log.warn 'Attribute changed:'
    Chef::Log.warn "  #{precedence}#{path}=#{value}"
    caller.each do |line|
      Chef::Log.warn "  #{line}" if line.include? Chef::Config[:file_cache_path]
    end
  end
end
