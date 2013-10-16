class UservoiceGenerator < Rails::Generator::Base

  def manifest
    unless [2, 3].include?(args.length)
      puts usage_message
      exit 1
    end

    record do |m|
      m.directory('config')
      m.template 'bazarvoice_template.yml', 'config/bazarvoice.yml'
    end
  end

end
