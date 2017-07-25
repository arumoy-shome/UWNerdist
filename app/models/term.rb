require 'api_helper'

class Term
  def self.current_term
    current_term_id = ApiHelper.get('terms/list')[:data][:current_term]

    ApiHelper.term_name(current_term_id.to_s)
  end
end
