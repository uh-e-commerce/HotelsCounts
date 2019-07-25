class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @balance_reports = Report.all.where(category_id: 1, user_id: current_user.id)
    @antiguity_reports = Report.all.where(category_id: 2, user_id: current_user.id)
  end

  def about

  end

  def error

  end
end
