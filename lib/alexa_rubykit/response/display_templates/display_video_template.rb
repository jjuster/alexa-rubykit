module AlexaRubykit

    class DisplayVideoTemplate

        attr_accessor :video_src, :title, :subtitle

        TEMPLATE_NAME       = "VideoApp.Launch".freeze
        def initialize()
            @title = nil
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
            template
        end

        def to_json
            self.to_hash.to_json
        end
    end
end
