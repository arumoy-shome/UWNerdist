class Term
  include ApiHelper

  def id
      @id ||= get('terms/list')[:data][:current_term]
  end

  private

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
