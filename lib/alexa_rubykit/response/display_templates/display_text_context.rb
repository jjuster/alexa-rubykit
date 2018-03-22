module AlexaRubykit
  class DisplayTextContext
    PLAIN_TEXT = "PlainText".freeze
    RICH_TEXT = "RichText".freeze

    def initialize
      @text_context = Hash.new()
    end

    def primary_text(type, text)
      @text_context[:primaryText] = {
        :type => type,
        :text => text
      }
    end

    def secondary_text(type, text)
      @text_context[:secondaryText] = {
        :type => type,
        :text => text
      }
    end

    def tertiary_text(type, text)
      @text_context[:tertiaryText] = {
        :type => type,
        :text => text
      }
    end

    def to_hash
      @text_context
    end
  end
end