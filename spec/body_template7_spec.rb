require 'rspec'
require 'alexa_rubykit/response/display_templates/display_body_template7'

describe 'Request handling' do
  it 'validate json format' do
    sample_json = JSON.parse(File.read('fixtures/sample-BodyTemplate7.json'))
    template = AlexaRubykit::DisplayBodyTemplate7.new
    template.token = sample_json["template"]["token"]
    template.back_button = (sample_json["template"]["backButton"] == "VISIBLE")
    background_image = AlexaRubykit::DisplayImage.new(
      sample_json["template"]["backgroundImage"]["sources"][0]["url"]
    )
    template.background_image = background_image
    image = AlexaRubykit::DisplayImage.new(
      sample_json["template"]["image"]["sources"][0]["url"]
    )
    template.image = image
    template_json = JSON.parse(template.to_json)

    expect(template_json["template"]["type"]).to eq('BodyTemplate7')

    expect(template_json["template"]["backgroundImage"]["sources"][0]).to include({
      "url" => sample_json["template"]["backgroundImage"]["sources"][0]["url"]
    })
    expect(template_json["template"]["image"]["sources"][0]).to include({
      "url" => sample_json["template"]["image"]["sources"][0]["url"]
    })
  end
end
