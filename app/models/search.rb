class SearchForm
  include ActiveModel::Model


  attr_accessor: start_model
  attr_accessor: end_model

  validate :date_before_start_date
  validate :date_before_end_date

  def date_before_start_date
	 errors.add(:start_model,'は今日以降のものを選択してください') if start_model < Date.today
  end
  def date_before_end_date
	 errors.add(:end_model,'は今日以降のものを選択してください') if end_model < Date.today
  end
end