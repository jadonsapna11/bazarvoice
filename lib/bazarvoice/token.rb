# This module represents an encrypted token
# to authenticate a bazar against the bazarvoice
# service.
#
# Author::    Sapna J 
# Copyright:: Copyright (c) 2013
# License::   Distributes under the same terms as Ruby

module Bazarvoice
  class Token
    attr_reader :data

    # Creates a sign-in token to authenticate bazar against
    # the bazarvoice service.
    # See https://ACCOUNT.bazarvoice.com/admin2/docs#/sso for
    # data properties available.
    #
    def initialize(key, api_key, data)
      data.merge!({:expires => (Time.now + 5 * 60).to_s})

      crypt_key = EzCrypto::Key.with_password(key, api_key)
      encrypted_data = crypt_key.encrypt(data.to_json)

      @data = CGI.escape(Base64.encode64(encrypted_data).gsub(/\n/, ''))
    end

    def to_s #:nodoc:
      @data
    end

  end
end
