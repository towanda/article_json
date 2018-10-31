module ArticleJSON
  module Export
    module Common
      module HTML
        module Elements
          module Image
            include ArticleJSON::Export::Common::HTML::Elements::Shared::Caption
            include ArticleJSON::Export::Common::HTML::Elements::Shared::Float

            # Generate the `<figure>` node containing the image and caption or
            # an `<a>` node containing the `<figure>` node if href is present.
            # @return [Nokogiri::XML::Element]
            def export
              @element.href.present? ? href_node : figure_node
            end

            private

            # @return [Nokogiri::XML::NodeSet]
            def figure_node
              create_element(:figure, node_opts) do |figure|
                figure.add_child(image_node)
                if @element.caption&.any?
                  figure.add_child(caption_node(:figcaption))
                end
              end
            end

            # @return [Nokogiri::XML::NodeSet]
            def image_node
              create_element(:img, src: @element.source_url)
            end

            # @return [Nokogiri::XML::NodeSet]
            def href_node
              create_element(:a, href: @element.href) do |a|
                a.add_child(figure_node)
              end
            end

            # @return [Hash]
            def node_opts
              return if floating_class.nil?
              { class: floating_class }
            end
          end
        end
      end
    end
  end
end
