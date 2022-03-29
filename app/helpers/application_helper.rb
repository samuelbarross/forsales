# frozen_string_literal: true

module ApplicationHelper
  def class_if_current_page(entry:)
    selected = is_current_page?(entry)

    class_name = 'active'
    class_name += ' open' unless current_page?(entry[:href])
    class_name if selected
  end

  def i18n_from_title(prefix:, title:)
    "#{prefix}#{title.downcase.gsub(' ', '_')}"
  end

  private

  def is_current_page?(entry)
    if current_page?(entry[:href])
      true
    elsif entry[:children]
      entry[:children].any?(&method(:is_current_page?))
    else
      false
    end
  end
end
