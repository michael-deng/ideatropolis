module ApplicationHelper

	# Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Unicornbase"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # Converts markdown to HTML
  def markdown(content)
  	options = {
	    :autolink => true,
	    :space_after_headers => true,
	    :no_intra_emphasis => true
	  }
	  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
	  markdown.render(content).html_safe
	end
end