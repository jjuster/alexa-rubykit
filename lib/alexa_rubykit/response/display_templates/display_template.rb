module AlexaRubykit
  # Amazon Alexa Display Interface and Template
  # https://developer.amazon.com/ja/docs/custom-skills/display-interface-reference.html

  class DisplayTemplate

    require 'alexa_rubykit/response/display_templates/display_image'

    attr_accessor :title, :back_button, :background_image

    def initialize()
      @back_button = true
      @title = ""
      @directive = {
        :type => "Display.RenderTemplate",
        :template => {}
      }
      @background_image = []
    end

    def back_button_status
      if @back_button
        "VISIBLE"
      else
        "HIDDEN"
      end
    end
  end
end
