module BirthControl
  module Extensions
    module Controller
      extend ActiveSupport::Concern

      included do
        before_filter :reset_birth_control
        after_filter  :birth_control_report
      end

      def reset_birth_control
        BirthControl::Counter.instance.reset
      end

      def birth_control_report
        Rails.logger.warn BirthControl::Report.new(BirthControl::Counter.instance.results)
      end
    end
  end
end
