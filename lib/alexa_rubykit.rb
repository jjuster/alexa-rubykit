require 'alexa_rubykit/request'
require 'alexa_rubykit/version'
require 'alexa_rubykit/response'
require 'alexa_rubykit/intent_request'
require 'alexa_rubykit/launch_request'
require 'alexa_rubykit/element_selected_request'
require 'alexa_rubykit/session_ended_request'
require 'alexa_rubykit/device'
require 'alexa_rubykit/response/display_templates/display_body_template1'
require 'alexa_rubykit/response/display_templates/display_body_template2'
require 'alexa_rubykit/response/display_templates/display_body_template3'
require 'alexa_rubykit/response/display_templates/display_body_template6'
require 'alexa_rubykit/response/display_templates/display_body_template7'
require 'alexa_rubykit/response/display_templates/display_list_template1'
require 'alexa_rubykit/response/display_templates/display_list_template2'
require 'alexa_rubykit/response/display_templates/display_text_context'
require 'alexa_rubykit/response/display_templates/display_image'

module AlexaRubykit
  # Prints a JSON object.
  def self.print_json(json)
    p json
  end

  # Prints the Gem version.
  def self.print_version
    p AlexaRubykit::VERSION
  end

  # Returns true if all the Alexa request objects are set.
  def self.valid_alexa?(request_json)
    !request_json.nil? && !request_json['session'].nil? &&
        !request_json['version'].nil? && !request_json['request'].nil?
  end
end