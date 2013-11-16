module BirthControl
  class Report
    def initialize(results)
      @results = results
    end

    def count_class_and_id(klass, id)
      @results[klass][id].size
    end

    def count_class(klass)
      @results[klass].inject(0) { |c, (id, _)| c + count_class_and_id(klass, id) }
    end

    def count
      @results.inject(0) { |c, (klass, _)| c + count_class(klass) }
    end

    def duplication_report
      lines = []

      @results.each do |klass, entries|
        entries.each do |id, callers|
          if callers.size > 1
            lines << "\n#{klass}(#{id}) - #{callers.size} times"
            callers.each_with_index do |caller, index|
              occurence = caller.detect { |call| call.match(/app\//) }
              occurence.sub!(/(.*)\/app\//, 'app/')
              lines << "  #{index+1}. #{occurence}"
            end
          end
        end
      end
      if lines.size > 0
        lines.unshift "*** [BirthControl] Duplicate instantiation detected ***"
        lines.join("\n") + "\n"
      end
    end

    def class_instantiation_report
      lines = ["*** [BirthControl] Class instantiation overview ***"]
      @results.each do |klass, _|
        count = "%5s" % count_class(klass)
        lines << "#{count} #{klass.pluralize}"
      end
      lines << "#{"%5s" % count} Total"
      lines.join("\n") + "\n"
    end

    def to_s
      lines = [
        '[BirthControl]',
        class_instantiation_report,
        duplication_report
      ]
      lines.join "\n"
    end
  end
end
