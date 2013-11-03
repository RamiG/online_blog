module ApplicationHelper

  def full_page_title(page_title)
    application_title = 'Online Blog'
    if page_title.empty?
      application_title
    else
      application_title + " | " + page_title
    end
  end

end