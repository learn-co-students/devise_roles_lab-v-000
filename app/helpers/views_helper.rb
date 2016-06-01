module ViewsHelper
  def error_content_tag(flash)
    unless flash.keys.empty?
      flash_type = flash.keys.first.to_sym
      content_tag :div, flash[flash_type], id: "flash_#{flash_type}" if flash_type
    end
  end
end
