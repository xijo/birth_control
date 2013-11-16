module BirthControl
  module Extensions
    module ActiveRecord
      extend ActiveSupport::Concern

      included do
        after_initialize :count_class_instantiation
      end

      def count_class_instantiation
        BirthControl::Counter.instance.count(self.class.name, id, caller)
      end
    end
  end
end
