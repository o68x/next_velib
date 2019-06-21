# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = '')
    base_title = "Vélibs"
    if page_title.empty?
      base_title + " ?"
    else
      base_title + "  vers " + page_title
    end
  end
end
