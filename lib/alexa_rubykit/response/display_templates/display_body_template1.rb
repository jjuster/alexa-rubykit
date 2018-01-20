module AlexaRubykit
    module DisplayTemplates
        require 'alexa_rubykit/response/display_templates/display_template'
        class DisplayBodyTemplate1 < DisplayTemplate

            require 'alexa_rubykit/response/display_templates/display_text_context'

            attr_accessor :title, :back_button, :background_image
            attr_accessor :token, :text_context

            TEMPLATE_NAME       = "BodyTemplate1".freeze
            def initialize()
                super
                @token = TEMPLATE_NAME + "_token"
                @text_context = DisplayTextContext.new()
            end

            def to_hash
                directive = Hash.new()
                directive[:template] = {
                    :type => TEMPLATE_NAME,
                    :token => @token,
                    :backButton => back_button_status,
                    :backgroundImage => @background_image.to_hash,
                    :title => @title,
                    :textContent => @text_context.to_hash
                }
                directive
            end

            def to_json
                self.to_hash.to_json
            end
        end
    end
end
