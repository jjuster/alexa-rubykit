require 'rspec'

describe 'Request handling' do
  it 'validate json format' do
    sample_json = JSON.parse(File.read('fixtures/sample-BodyTemplate3.json'))
    template = AlexaRubykit::DisplayBodyTemplate3.new
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
      sample_json["template"]["backgroundImage"]["contentDescription"],
      sample_json["template"]["backgroundImage"]["sources"][0]["size"],
      sample_json["template"]["backgroundImage"]["sources"][0]["widthPixels"],
      sample_json["template"]["backgroundImage"]["sources"][0]["heightPixels"]
    )
    image = AlexaRubykit::DisplayImage.new(
      sample_json["template"]["image"]["sources"][0]["url"],
      sample_json["template"]["image"]["contentDescription"]
    )
    template.text_context = context
    template.background_image = background_image
    template.image = image
    template_json = JSON.parse(template.to_json)

    expect(template_json["template"]["type"]).to eq('BodyTemplate3')
    expect(template_json["template"]["textContent"]["primaryText"]).to include({
      "type" => sample_json["template"]["textContent"]["primaryText"]["type"],
      "text" => sample_json["template"]["textContent"]["primaryText"]["text"]
    })
    expect(template_json["template"]["textContent"]["secondaryText"]).to include({
      "type" => sample_json["template"]["textContent"]["secondaryText"]["type"],
      "text" => sample_json["template"]["textContent"]["secondaryText"]["text"]
    })
    expect(template_json["template"]["textContent"]["tertiaryText"]).to include({
      "type" => sample_json["template"]["textContent"]["tertiaryText"]["type"],
      "text" => sample_json["template"]["textContent"]["tertiaryText"]["text"]
    })

    expect(template_json["template"]["backgroundImage"]["contentDescription"]).to eq(sample_json["template"]["backgroundImage"]["contentDescription"])
    expect(template_json["template"]["backgroundImage"]["sources"][0]).to include({
      "url" => sample_json["template"]["backgroundImage"]["sources"][0]["url"]
    })

    expect(template_json["template"]["image"]["contentDescription"]).to eq(sample_json["template"]["image"]["contentDescription"])
    expect(template_json["template"]["image"]["sources"][0]).to include({
      "url" => sample_json["template"]["image"]["sources"][0]["url"]
    })
  end
end
