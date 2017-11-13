describe ArticleJSON::Export::FacebookInstantArticle::Elements::Embed do
  subject(:element) { described_class.new(source_element) }
  let(:type) { :youtube_video }

  let(:source_element) do
    ArticleJSON::Elements::Embed.new(
      embed_type: type,
      embed_id: 666,
      caption: [ArticleJSON::Elements::Text.new(content: 'Foo Bar')],
      tags: %w(test)
    )
  end

  describe '#export' do
    subject { element.export.to_html(save_with: 0) }
    let(:oembed_data) { { html: 'Embedded Object: something-666' } }
    before do
      allow(source_element).to receive(:oembed_data).and_return(oembed_data)
    end

    context 'when the element it is not a facebook vide nor a tweet' do
      let(:expected_html) do
        '<figure class="op-interactive">Embedded Object: something-666' \
        '<figcaption>Foo Bar</figcaption></figure>'
      end

      it { should eq expected_html }
    end

    context 'with a tweet' do
      let(:type) { :tweet }
      let(:expected_html) do
        '<figure class="op-interactive">' \
        '<iframe>Embedded Object: something-666</iframe>' \
        '<figcaption>Foo Bar</figcaption></figure>'
      end

      it { should eq expected_html }
    end

    context 'with a tweet' do
      let(:type) { :facebook_video }
      let(:expected_html) do
        '<figure class="op-interactive">' \
        '<iframe>Embedded Object: something-666</iframe>' \
        '<figcaption>Foo Bar</figcaption></figure>'
      end

      it { should eq expected_html }
    end
  end
end
