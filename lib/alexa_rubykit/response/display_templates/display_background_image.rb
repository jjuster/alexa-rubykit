module AlexaRubykit
  class DisplayBackgroundImage
    def initialize(url, description="", size=nil, width=nil, height=nil)
      @back_ground_image = Hash.new()
      @back_ground_image[:contentDescription] = description
      @back_ground_image[:sources] = []

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
      @back_ground_image[:sources].push(source)
    end

    def to_hash
      @back_ground_image
    end
  end
end