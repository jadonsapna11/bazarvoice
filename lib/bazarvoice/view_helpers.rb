module Bazarvoice
  module BazarvoiceViewHelpers

    # Renders javascript to configure bazarvoice feedback widget. Options
    # can be used to override default settings like forum id.
    # e.g. bazarvoice_config_javascript(forum_id => 12345)
    # See https://ACCOUNT.bazarvoice.com/admin2/docs#/widget for options
    # available.
    #
    def bazarvoice_config_javascript(options={})
      config = bazarvoice_configuration['bazarvoice_options'].dup
      config.merge!(options)

      if config[:sso] && config[:sso][:guid]
        config.merge!(:params => {:sso => Bazarvoice::Token.new(
          bazarvoice_configuration['bazarvoice_options']['key'],
          bazarvoice_configuration['bazarvoice_api']['api_key'],
          config.delete(:sso)).to_s})
      end

      <<-EOS
        <script type="text/javascript">
		      $(document).ready(function() {
		      $.ajaxSetup({ cache: true });
		      $.getJSON(api_server+"/reviews.json?callback=?", 
		      "apiversion=4.9&include=products,authors&filter=DisplayLocale:en_US&passkey=" + bazarvoice_configuration['bazarvoice_api']['api_key'] + "&limit=" + num_items,
		    function(json){
		      jQuery.each(json.Results, function(index, review) {
			$("#module").append("<h1>"+review['Title']+"</h1>");
		      });
		  });
		});
	</script>
      EOS
    end

  end
end
