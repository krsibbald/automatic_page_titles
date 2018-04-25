module AutomaticPageTitles
  module PageTitleHelper
    def page_title(page_title = nil)
      "#{admin_prefix}#{page_title_no_admin_prefix(page_title)}"
    end

    def page_title_no_admin_prefix(page_title = nil)
      @page_title = page_title unless page_title.nil?
      @page_title || restful_page_title || custom_action_page_title
    end

    def restful_page_title
      case action_name
      when "index"
        controller_title
      when "show"
        "#{controller_title_singular}#{padded_automatic_variable_title}"
      when "edit", "update"
        "Edit #{controller_title_singular}#{padded_automatic_variable_title}"
      when "new", "create"
        "New #{controller_title_singular}"
      end
    end

    def custom_action_page_title
      if params[:id].present?
        "#{action_name.titleize} #{controller_title_singular}#{padded_automatic_variable_title}"
      else
        "#{action_name.titleize} #{controller_title}"
      end
    end

    def controller_title
      controller_name.titleize
    end

    def controller_title_singular
      controller_title.singularize
    end


    def path_to_page_title(path = current_path)
      title = path.to_s.split("/").last
      return nil if title.nil?

      title = title.gsub(/[-_]/, " ")
      title = title.gsub(/\s+/, " ").strip
      title.humanize
    end

    def default_page_title
      Rails.application.class.to_s.split("::").first.underscore.humanize
    end

    def current_path
      request.try :path
    end

    def path_without_last_segment(path)
      path  = path.to_s
      index = path.rindex("/")
      index ? path[0, index] : nil
    end

    def automatic_variable_title
      return unless controller && controller_name
      var_name = "@" + controller_name.singularize
      variable = controller.instance_variable_get(var_name)
      variable.try(:title) || variable.try(:name)
    end

    def padded_automatic_variable_title
      return "" if automatic_variable_title.blank?
      ": #{automatic_variable_title}"
    end

    def admin_prefix
      current_path = request.try :path
      return '' unless current_path.to_s.match?(%r{\/admin\/})
      "Administrator - "
    end
  end
end
