# Simple approach
Koala::Facebook::OAuth.class_eval do
  def initialize_with_default_settings(*args)
    raise "application id and/or secret are not specified in the envrionment" unless ENV['FB_ID'] && ENV['FB_SECRET']
    initialize_without_default_settings(ENV['FB_ID'].to_s, ENV['FB_SECRET'].to_s, args.first)
  end

  alias_method_chain :initialize, :default_settings
end
