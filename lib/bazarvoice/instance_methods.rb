# This module holds all instance methods to be
# included into ActionController::Base class
# for enabling bazavoice in a Rails app.
#
# Author::    Sapna J 
# Copyright:: Copyright (c) 2013 il tempo
# License::   Distributes under the same terms as Ruby

require "erb"

module Bazarvoice
  module InstanceMethods

    # Making helper method available when module
    # gets included into ActionController::Base.
    #
    def self.included(mod)
      mod.send(:helper_method, :bazarvoice_configuration)
    end

    # Set bazarvoice configuration file path.
    # Can be overridden.
    #
    def bazarvoice_configuration_file #:nodoc:
      "#{::Rails.root}/config/bazarvoice.yml"
    end

    # Returns the bazarvoice configuration hash.
    # It's been lazy loaded and cached in the controller class.
    #
    def bazarvoice_configuration
      @@bazarvoice_configuration ||= begin
        config = ERB.new(IO.read(bazarvoice_configuration_file)).result
        configuration = YAML::load(config)
        HashWithIndifferentAccess.new(configuration)
      end
    end

  end
end
