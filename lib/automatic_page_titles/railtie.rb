require "automatic_page_titles/page_title_helper"

module AutomaticPageTitles
  class Railtie < Rails::Railtie
    initializer "page_title.helper" do
      ActionView::Base.send :include, PageTitleHelper
    end
  end
end
