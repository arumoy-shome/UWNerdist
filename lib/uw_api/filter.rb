module UwApi
  class Filter
    attr_reader :response, :subjects, :term

    DAYS = { 1 => "M", 2 => "T", 3 => "W", 4 => "Th", 5 => "F" }

    def initialize(response, **args)
      @response = response
      @subjects = args[:subjects]
      @term = args[:term]
    end

    def by_subject
      return response unless subjects

      sane_subjects = sanitize(subjects.split(','))

      response[:data].select{ |course| sane_subjects.include?(course[:subject]) }
    end

    private

    def is_today?(raw)
      raw.scan(/[A-Z][^A-Z]*/).include?(DAYS(Time.now.wday))
    end

    def sanitize(dirty_list)
      clean_list = []

      dirty_list.each { |item| clean_list << item.strip.upcase }

      clean_list
    end
  end
end
