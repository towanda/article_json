module ArticleJSON
  module Export
    module FacebookInstantArticle
      module Elements
        class List < Base
          include ArticleJSON::Export::Common::HTML::Elements::List
        end
      end
    end
  end
end
