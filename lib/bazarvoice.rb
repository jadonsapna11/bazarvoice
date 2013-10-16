module Bazarvoice
end

require 'cgi'
require 'ezcrypto'
require 'bazarvoice/token'
require 'bazarvoice/instance_methods'
require 'bazarvoice/view_helpers'

ActionController::Base.send(:include, Bazarvoice::InstanceMethods)
ActionView::Base.send(:include, Bazarvoice::BazarvoiceViewHelpers)
