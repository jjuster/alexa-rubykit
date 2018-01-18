module AlexaRubykit

    require 'alexa_rubykit/response/display_templates/display_template'
    class DisplayBodyTemplate1 < DisplayTemplate

        require 'alexa_rubykit/response/display_templates/display_background_image'
        require 'alexa_rubykit/response/display_templates/display_text_context'

        attr_accessor :title, :back_button
        attr_accessor :token, :text_context, :background_image

        TEMPLATE_NAME       = "BodyTemplate1".freeze
        def initialize()
            super
            @background_image = []
            @token = TEMPLATE_NAME + "_token"
            @text_context = DisplayTextContext.new()
        end

        def to_json
            directive = Hash.new()
            directive[:template] = {
                :type => TEMPLATE_NAME,
                :token => @token,
                :backButton => back_button_status,
                :backgroundImage => @background_image.to_hash,
                :title => @title,
                :textContent => @text_context.to_hash
            }
            directive.to_json
        end

    end
end
