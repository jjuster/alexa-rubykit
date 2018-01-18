module AlexaRubykit
  class DisplayImage
    def initialize(url, description="", size=nil, width=nil, height=nil)
      @display_image = Hash.new()
      @display_image[:contentDescription] = description
      @display_image[:sources] = []

      self.add_source(url, description, size, width, height)
    end

    def add_source(url, description="", size=nil, width=nil, height=nil)
      source = Hash.new()
      source[:url] = url

      if description
        source[:description] = description
      end
      if size
        source[:size] = size
      end
      if width
        source[:widthPixels] = width
      end
      if height
        source[:heightPixels] = height
      end
      @display_image[:sources].push(source)
    end

    def to_hash
      @display_image
    end
  end
end