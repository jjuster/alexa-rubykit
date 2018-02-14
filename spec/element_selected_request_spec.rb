require 'rspec'
require 'alexa_rubykit'

describe 'Element Selected Request handling' do

  it 'should accept a element select request' do
    sample_request = JSON.parse(File.read('fixtures/sample-element-select-request.json'))
    request = AlexaRubykit::build_request(sample_request)
    expect(request.type).to eq('ELEMENT_SELECTED')
    expect(request.display_token).to eq('display_token')
    expect(request.request_token).to eq('request_token')
  end

end
