module Update

  #
  # Update a given goat setting
  #
  def setting(name, value)
    brain.settings[name.to_sym] = value
    brain.save_settings
    puts brain.settings[name.to_sym].to_yaml
  end

  #
  # Update the credentials for a particular service
  #
  def credentials(service, *args)
    args.each do |pair|
      key, value = pair.split('=')
      brain.credentials[service.to_sym][key.to_sym] = value
    end
    brain.save_credentials
    puts brain.credentials[service.to_sym].to_yaml
  end

end

