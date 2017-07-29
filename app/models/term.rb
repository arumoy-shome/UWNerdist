class Term
  include ApiHelper

  def current_term
    current_term_id = get('terms/list')[:data][:current_term]

    term_name(current_term_id.to_s)
  end

  def term_name(id)
    term_name = "#{Time.current.year}"

    if /9$/.match?(id)
      term_name.prepend('Fall ')
    elsif /5$/.match?(id)
      term_name.prepend('Spring ')
    else
      term_name.prepend('Winter ')
    end

    term_name
  end
end
