module EventsHelper

  def has_paid(attendance)
    if attendance.is_paid 
      content_tag(:button, "Paid", data: {id: attendance.id}, class: "payment paid") 
    else
      content_tag(:button, "Unpaid", data: {id: attendance.id}, class: "payment unpaid")
    end
  end

end