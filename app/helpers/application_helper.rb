module ApplicationHelper
  def phone_number_link(text)
    if text
      sets_of_numbers = text.scan(/[0-9]+/)
      number = "+1-#{sets_of_numbers.join('-')}"
      link_to text, "tel:#{number}"
    end
  end

 def markdown(text)
    # options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    # Redcarpet.new(text, *options).to_html.html_safe
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, :fenced_code_blocks => true, :no_intra_emphasis => true)
    
    m = markdown.render(text).html_safe
    # p m.methods.sort
  end




end
