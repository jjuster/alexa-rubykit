module AlexaRubykit

    require 'alexa_rubykit/response/display_templates/display_template'
    class DisplayVideoTemplate < DisplayTemplate

        attr_accessor :title
        attr_accessor :video_src, :subtitle

        TEMPLATE_NAME       = "VideoApp.Launch".freeze
        def initialize()
            super
            @video_src = nil
            @subtitle = ""
        end

        def to_hash
            template = Hash.new
            template[:type] = TEMPLATE_NAME
            template[:videoItem] = {
                :source => @video_src,
                :metadata => {
                    :title => @title,
                    :subtitle => @subtitle
                }
            }
            @directive[:template] = template
            @directive
        end

        def to_json
            self.to_hash.to_json
        end
    end
end
