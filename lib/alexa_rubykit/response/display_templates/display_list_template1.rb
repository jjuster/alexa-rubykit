module AlexaRubykit

    require 'alexa_rubykit/response/display_templates/display_template'
    class DisplayListTemplate1 < DisplayTemplate

        attr_accessor :title, :back_button, :background_image
        attr_accessor :token, :list_item

        TEMPLATE_NAME       = "ListTemplate1".freeze
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
            if image
                item[:image] = image.to_hash
            end
            @list_item.push(item)
        end

        def to_hash
            template = Hash.new
            template[:type] = TEMPLATE_NAME
            template[:token] = @token
            template[:backButton] = back_button_status
            template[:title] = @title
            template[:backgroundImage] = @background_image.to_hash unless @background_image.nil?
            template[:listItems] = @list_item
            @directive[:template] = template
            @directive
        end

        def to_json
            self.to_hash.to_json
        end
    end
end
