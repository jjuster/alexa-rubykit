module AlexaRubykit

    require 'alexa_rubykit/response/display_templates/display_template'
    class DisplayListTemplate2 < DisplayTemplate

        require 'alexa_rubykit/response/display_templates/display_text_context'

        attr_accessor :title, :back_button, :background_image
        attr_accessor :token, :list_item

        TEMPLATE_NAME       = "ListTemplate2".freeze
        def initialize()
            super
            @token = TEMPLATE_NAME + "_token"
            @list_item = []
        end

        def add_list_item(text_content, token=nil, image=nil)
            item = Hash.new()
            item[:textContent] = text_content
            if token
                item[:token] = token
            else
                item[:token] = "LIST_ITEM_" + @list_item.length.to_s
            end
            if token
                item[:image] = image
            end
            @list_item.push(item)
        end

        def to_hash
            @directive[:template] = {
                :type => TEMPLATE_NAME,
                :token => @token,
                :backButton => back_button_status,
                :backgroundImage => @background_image.to_hash,
                :title => @title,
                :listItems => @list_item
            }
            @directive
        end

        def to_json
            self.to_hash.to_json
        end
    end
end
