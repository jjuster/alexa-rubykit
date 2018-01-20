require 'rspec'
require 'alexa_rubykit/response/display_templates/display_list_template1'

describe 'Request handling' do
  it 'validate json format' do
    sample_json = JSON.parse(File.read('fixtures/sample-ListTemplate1.json'))
    template = AlexaRubykit::DisplayListTemplate1.new
    template.token = sample_json["template"]["token"]
    template.back_button = (sample_json["template"]["backButton"] == "VISIBLE")

    background_image = AlexaRubykit::DisplayImage.new(
      sample_json["template"]["backgroundImage"]["sources"][0]["url"],
      sample_json["template"]["backgroundImage"]["contentDescription"]
    )

    for item in sample_json["template"]["listItems"] do
      context = AlexaRubykit::DisplayTextContext.new
      context.primary_text(
        item["textContent"]["primaryText"]["type"],
        item["textContent"]["primaryText"]["text"]
      )
      context.secondary_text(
        item["textContent"]["secondaryText"]["type"],
        item["textContent"]["secondaryText"]["text"]
      )
      context.tertiary_text(
        item["textContent"]["tertiaryText"]["type"],
        item["textContent"]["tertiaryText"]["text"]
      )
      image = AlexaRubykit::DisplayImage.new(
        item["image"]["sources"][0]["url"],
        item["image"]["contentDescription"]
      )
      template.add_list_item(
        context,
        item["token"],
        image
      )
    end

    template.background_image = background_image
    template_json = JSON.parse(template.to_json)

    expect(template_json["template"]["type"]).to eq('ListTemplate1')
    expect(template_json["template"]["listItems"].length).to eq(sample_json["template"]["listItems"].length)
  end
end
