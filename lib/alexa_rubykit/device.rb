module AlexaRubykit
  # Handles the device object in request.
  class Device
    def initialize(device)
      if device.nil? || device['context'].nil? || device['context']['System'].nil? || device['context']['System']['device'].nil?
        @device = nil
      else
        @device = device['context']['System']['device'] 
      end
    end

    def device_id
      @device['deviceId'] if @device
    end

    def device_support?
      !@device.nil? && !@device['supportedInterfaces'].nil? && !@device['supportedInterfaces']['Display'].nil?
    end

    def audio_player_support?
      !@device.nil? && !@device['supportedInterfaces'].nil? && !@device['supportedInterfaces']['AudioPlayer'].nil?
    end

    def video_app_support?
      !@device.nil? && !@device['supportedInterfaces'].nil? && !@device['supportedInterfaces']['VideoApp'].nil?
    end
  end
end