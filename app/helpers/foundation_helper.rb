module FoundationHelper
  def flash_map(flashes = {})
    flash_foundation = {:notice => 'success', :alert => 'standard', :error => 'alert', :secondary => 'secondary'}

    closer = link_to escape_once("&times;"), '#',  class: :close

    content = []
    flashes.each do |kind, message|

      # some of the devise flashes are of the form
      # :timedout => true
      # there is always a standard flash message in the array as well,
      # so we just use the kind for these non-standard ones
      message = kind.to_s.humanize unless flash_foundation.has_key?(kind)

      style = flash_foundation.fetch(kind, 'standard')

      fragment = content_tag(:div, message, class: "alert-box radius #{style}", data: {alert: ''}) do
        (message + closer).html_safe
      end

      content << fragment
    end
    
    content.join.html_safe
  end
end
