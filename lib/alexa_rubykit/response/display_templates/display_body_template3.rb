module AlexaRubykit

    require 'alexa_rubykit/response/display_templates/display_template'
    class DisplayBodyTemplate3 < DisplayTemplate

        attr_accessor :title, :back_button, :background_image
        attr_accessor :token, :text_context, :image

        TEMPLATE_NAME       = "BodyTemplate3".freeze
        def initialize()
            super
            @image = []
            @token = TEMPLATE_NAME + "_token"
            @text_context = DisplayTextContext.new()
        end

        def to_hash
            @directive[:template] = {
                :type => TEMPLATE_NAME,
                :token => @token,
                :backButton => back_button_status,
                :backgroundImage => @background_image.to_hash,
                :title => @title,
                :image => @image.to_hash,
                :textContent => @text_context.to_hash
            }
            @directive
        end

        def to_json
            self.to_hash.to_json
        end
    end
end
