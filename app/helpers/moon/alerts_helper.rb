module Moon
  module AlertsHelper
    def display_success_alert(alert)
      return unless alert
      content_tag(:div, class: 'alert alert-success') do
        concat alert
        concat content_tag(:button, 'x', class: 'close', 'aria-hidden'=> true, 'data-dismiss'=> 'alert')
      end
    end
  end
end
