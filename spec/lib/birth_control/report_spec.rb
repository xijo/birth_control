require 'spec_helper'

describe BirthControl::Report do
  let(:results) do
    {
      'Project' => {
        1 => [['somewhere/app/models/project.rb:123'], ['somewhere/lib/project_counter.rb:1']],
        2 => [['somewhere/app/models/project.rb:123']]
      },
      'User' => {
        1 => [['somewhere/app/controllers/sessions_controller.rb:1']],
      }
    }
  end
  let(:report) { BirthControl::Report.new(results) }

  it '#count returns total of all counted objects' do
    report.count_class_and_id('Project', 1).should eq 2
    report.count_class('Project').should eq 3
    report.count.should eq 4
  end

end
