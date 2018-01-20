module AlexaRubykit
    require 'alexa_rubykit/response/display_templates/display_template'
    class DisplayBodyTemplate1 < DisplayTemplate

        attr_accessor :title, :back_button, :background_image
        attr_accessor :token, :text_context

        TEMPLATE_NAME       = "BodyTemplate1".freeze
        def initialize()
            super
            @token = TEMPLATE_NAME + "_token"
            @text_context = DisplayTextContext.new()
        end

        def to_hash
            template = Hash.new
            template[:type] = TEMPLATE_NAME
            template[:token] = @token
            template[:backButton] = back_button_status
            template[:title] = @title
            template[:backgroundImage] = @background_image.to_hash unless @background_image.nil?
            template[:textContent] = @text_context.to_hash
            @directive[:template] = template
            @directive
        end

        def to_json
            self.to_hash.to_json
        end
    end
end
