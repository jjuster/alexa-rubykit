module AlexaRubykit
  # Amazon Alexa Display Interface and Template
  # https://developer.amazon.com/ja/docs/custom-skills/display-interface-reference.html

  attr_accessor :title, :back_button

  class DisplayTemplate
    def initialize()
      @back_button = true
      @directive = {
        :type => "Display.RenderTemplate",
        :template => {}
      }
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
