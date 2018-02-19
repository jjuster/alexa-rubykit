require 'rspec'

describe 'Request handling' do
  it 'validate json format' do
    template = AlexaRubykit::DisplayVideoTemplate.new
    template.title = "video_title"
    template.subtitle = "video_subtitle"
    template.video_src = "https://example.com/video.mp4"

    template_json = JSON.parse(template.to_json)

    expect(template_json["template"]["type"]).to eq('VideoApp.Launch')
    expect(template_json["template"]["videoItem"]["source"]).to eq("https://example.com/video.mp4")
  end
end
