class Report::Step < ApplicationRecord
  acts_as_paranoid
  belongs_to :report_scenario, class_name: '::Report::Scenario'
  belongs_to :step, class_name: '::Step'
  belongs_to :user, class_name: '::User'

  validates :step_id, uniqueness: { scope: :report_scenario_id }
  state_machine :state, initial: :pending do
    event :pass do
      transition [:pending, :failed, :blocked] => :passed
    end
    event :blocking do
      transition [:pending] => :blocked
    end
    event :decline do
      transition [:pending, :blocked] => :failed
    end
  end

  after_commit :update_report_scenario

  def state
    self[:state]
  end

  private

  def update_report_scenario
    if passed?
      other_report_steps = ::Report::Step.where(report_scenario_id: self.report_scenario_id).where.not(id: self.id).to_a
      all_success = other_report_steps.all?(&:passed?)
      ReportService.update_report_scenario(self.report_scenario, {state: 'passed'}) if all_success
    elsif failed?
      ReportService.update_report_scenario(self.report_scenario, {state: 'failed'})
    end
  end
end
