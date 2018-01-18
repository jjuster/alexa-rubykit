require 'rspec'
require 'alexa_rubykit/response/display_templates/display_body_template2'

describe 'Request handling' do
  it 'validate json format' do
    sample_json = JSON.parse(File.read('fixtures/sample-BodyTemplate2.json'))
    template = AlexaRubykit::DisplayBodyTemplate2.new
    template.token = sample_json["template"]["token"]
    template.back_button = (sample_json["template"]["backButton"] == "VISIBLE")
    context = AlexaRubykit::DisplayTextContext.new
    context.primary_text(
      sample_json["template"]["textContent"]["primaryText"]["type"],
      sample_json["template"]["textContent"]["primaryText"]["text"]
    )
    context.secondary_text(
      sample_json["template"]["textContent"]["secondaryText"]["type"],
      sample_json["template"]["textContent"]["secondaryText"]["text"]
    )
    context.tertiary_text(
      sample_json["template"]["textContent"]["tertiaryText"]["type"],
      sample_json["template"]["textContent"]["tertiaryText"]["text"]
    )
    background_image = AlexaRubykit::DisplayImage.new(
      sample_json["template"]["backgroundImage"]["sources"][0]["url"],
      sample_json["template"]["backgroundImage"]["contentDescription"]
    )
    image = AlexaRubykit::DisplayImage.new(
      sample_json["template"]["image"]["sources"][0]["url"],
      sample_json["template"]["image"]["contentDescription"],
      sample_json["template"]["image"]["sources"][0]["size"],
      sample_json["template"]["image"]["sources"][0]["widthPixels"],
      sample_json["template"]["image"]["sources"][0]["heightPixels"],
    )
    template.text_context = context
    template.background_image = background_image
    template.image = image
    template_json = JSON.parse(template.to_json)

    expect(template_json["template"]["type"]).to eq('BodyTemplate2')
    expect(template_json["template"]["textContent"]["primaryText"]["type"]).to eq(sample_json["template"]["textContent"]["primaryText"]["type"])
    expect(template_json["template"]["textContent"]["primaryText"]["text"]).to eq(sample_json["template"]["textContent"]["primaryText"]["text"])
    expect(template_json["template"]["textContent"]["secondaryText"]["type"]).to eq(sample_json["template"]["textContent"]["secondaryText"]["type"])
    expect(template_json["template"]["textContent"]["secondaryText"]["text"]).to eq(sample_json["template"]["textContent"]["secondaryText"]["text"])
    expect(template_json["template"]["textContent"]["tertiaryText"]["type"]).to eq(sample_json["template"]["textContent"]["tertiaryText"]["type"])
    expect(template_json["template"]["textContent"]["tertiaryText"]["text"]).to eq(sample_json["template"]["textContent"]["tertiaryText"]["text"])

    expect(template_json["template"]["backgroundImage"]["sources"][0]["url"]).to eq(sample_json["template"]["backgroundImage"]["sources"][0]["url"])
    expect(template_json["template"]["backgroundImage"]["contentDescription"]).to eq(sample_json["template"]["backgroundImage"]["contentDescription"])

    expect(template_json["template"]["image"]["sources"][0]["url"]).to eq(sample_json["template"]["image"]["sources"][0]["url"])
    expect(template_json["template"]["image"]["contentDescription"]).to eq(sample_json["template"]["image"]["contentDescription"])
    expect(template_json["template"]["image"]["sources"][0]["size"]).to eq(sample_json["template"]["image"]["sources"][0]["size"])
    expect(template_json["template"]["image"]["sources"][0]["widthPixels"]).to eq(sample_json["template"]["image"]["sources"][0]["widthPixels"])
    expect(template_json["template"]["image"]["sources"][0]["heightPixels"]).to eq(sample_json["template"]["image"]["sources"][0]["heightPixels"])
  end
end
