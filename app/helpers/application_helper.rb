module ApplicationHelper

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink=> true, :space_after_headers => true)
    markdown.render(text).html_safe
  end

  def selected_if_section?(s); (@current_section || nil) == s ? 'current' : ''; end

  def display_form_error(o,*a)
    str = []
    a.each do |k|
      next if o.errors[k].blank?
      c = o.class.to_s.underscore.to_sym
      o.errors[k].each do |v|
        h = I18n.t(v.gsub(/\s/m, '_').to_sym, :scope => [:models, c, :errors, k], :default => '') rescue nil
        x = (!h.blank? ? h : "#{k.to_s.titleize} #{v}")
        str << "<p class='form_error'>#{x}#{'.' unless x.match(/[\.\?\!]$/)}</p>"
        break
      end
    end

    return '' if str.blank?
    "<div class='form_errors'>#{str.join("\n")}</div>".html_safe
  end

end
