module ArticleJSON
  module Export
    module HTML
      module Elements
        class Base
          include ArticleJSON::Export::Common::HTML::Elements::Base

          class << self
            # Return the module namespace this class and its subclasses are
            # nested in
            # @return [Module]
            def namespace
              ArticleJSON::Export::HTML::Elements
            end

            private

            # The format this exporter is returning. This is used to determine
            # which custom element exporters should be applied from the
            # configuration.
            # @return [Symbol]
            def export_format
              :html
            end
          end
        end
      end
    end
  end
end
