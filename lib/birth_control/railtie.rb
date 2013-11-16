module BirthControl
  class Railtie < Rails::Railtie
    initializer 'birth_control.initialize_extensions' do
      if BirthControl.enabled?
        ActiveRecord::Base.send     :include, BirthControl::Extensions::ActiveRecord
        ActionController::Base.send :include, BirthControl::Extensions::Controller
      end
    end
  end
end
