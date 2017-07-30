class Term
  include ApiHelper

  def id
    @id ||= get('terms/list')[:data][:current_term]
  end

  def name
    @name ||= id_to_name
  end

  private

  def id_to_name
    name = "#{Time.current.year}"

    if /9$/.match?(id.to_s)
      name.prepend('Fall ')
    elsif /5$/.match?(id.to_s)
      name.prepend('Spring ')
    else
      name.prepend('Winter ')
    end

    name
  end
end
