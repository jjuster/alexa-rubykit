module AlexaRubykit
  class ElementSelectedRequest  < Request

    attr_accessor :display_token, :request_token

    def initialize(json_request)
      super
      @type = 'ELEMENT_SELECTED'
      @display_token = json_request['context']['Display']['token']
      @request_token = json_request['request']['token']
    end

    def to_s
      "LaunchRequest requestID: #{request_id}"
    end
  end
end