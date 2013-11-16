module BirthControl
  class Counter
    include Singleton

    attr_accessor :results

    def initialize
      reset
    end

    def count(klass, id, caller = [])
      @results[klass] ||= {}
      @results[klass][id] ||= []
      @results[klass][id] << caller
      @results
    end

    def reset
      @results = {}
    end
  end
end
