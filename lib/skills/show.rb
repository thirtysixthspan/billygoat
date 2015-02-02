module Show

  #
  # Show all goat settings
  #
  def settings
    puts brain.settings.to_yaml
  end

  #
  # Show a given goat setting
  #
  def setting(name)
    puts brain.settings[name.to_sym].to_yaml
  end

  #
  # Show the credentials for a particular service
  #
  def credentials(service = nil)
    credentials = brain.credentials
    credentials = credentials[service.to_sym] if service
    puts credentials.to_yaml
  end

end

