module ApplicationHelper
  include Pagy::Frontend

  def alert_class(key)
    case key
    when "alert", "error"
      "alert-danger"
    when "notice", "info"
      "alert-info"
    when "warning"
      "alert-warning"
    when "success"
      "alert-success"
    else
      "alert-info"
    end
  end
end
