module AlexaRubykit

    require 'alexa_rubykit/response/display_templates/display_template'
    class DisplayBodyTemplate7 < DisplayTemplate

        require 'alexa_rubykit/response/display_templates/display_text_context'

        attr_accessor :title, :back_button, :background_image
        attr_accessor :token, :image

        TEMPLATE_NAME       = "BodyTemplate7".freeze
        def initialize()
            super
            @image = []
            @token = TEMPLATE_NAME + "_token"
        end

        def to_hash
            @directive[:template] = {
                :type => TEMPLATE_NAME,
                :token => @token,
                :backButton => back_button_status,
                :backgroundImage => @background_image.to_hash,
                :image => @image.to_hash,
                :title => @title
            }
            @directive
        end

        def to_json
            self.to_hash.to_json
        end
    end
end
