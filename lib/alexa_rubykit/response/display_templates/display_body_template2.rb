module AlexaRubykit

    require 'alexa_rubykit/response/display_templates/display_template'
    class DisplayBodyTemplate2 < DisplayTemplate

        attr_accessor :title, :back_button, :background_image
        attr_accessor :token, :text_context, :image

        TEMPLATE_NAME       = "BodyTemplate2".freeze
        def initialize()
            super
            @image = []
            @token = TEMPLATE_NAME + "_token"
            @text_context = DisplayTextContext.new()
        end

        def to_hash
            template = Hash.new
            template[:type] = TEMPLATE_NAME
            template[:token] = @token
            template[:backButton] = back_button_status
            template[:title] = @title
            template[:image] = @image.to_hash
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
