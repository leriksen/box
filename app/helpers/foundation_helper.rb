module FoundationHelper
  def flash_map(flashes = {})
    flash_foundation = {:notice => 'success', :alert => 'standard', :error => 'alert', :secondary => 'secondary'}

    closer = link_to escape_once("&times;"), '#',  class: :close

    content = []
    flashes.each do |kind, message|
      style = flash_foundation.fetch(kind, 'standard')

      fragment = content_tag(:div, message, class: "alert-box radius #{style}", data: {alert: ''}) do

        (message + closer).html_safe
      end
      content << fragment

    end

    content.join.html_safe
  end
end
