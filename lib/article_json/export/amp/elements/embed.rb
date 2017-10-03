module ArticleJSON
  module Export
    module AMP
      module Elements
        class Embed < Base
          include Shared::Caption

          def export
            create_element(:figure).tap do |figure|
              figure.add_child(embed_node)
              figure.add_child(caption_node(:figcaption))
            end
          end

          private

          def embed_node
            create_element(:div, class: 'embed').tap do |div|
              div.add_child(embedded_node)
            end
          end

          def embedded_node
            case @element.embed_type
            when YoutubeVideo
              youtube_node
            when VimeoVideo
              vimeo_node
            end
          end

          def youtbe_node
            create_element('amp-youtube',
                           data-videoid: @element.embed_id,
                           width: '560',
                           height: '315')
          end

          def vimeo_node
            create_element('amp-vimeo',
                           data-videoid: @element.embed_id,
                           width: '560',
                           height: '315')
          end
        end
      end
    end
  end
end
