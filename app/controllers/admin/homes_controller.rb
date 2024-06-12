class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    # 管理者用のダッシュボード等のロジックをここに記述します
  end
  def index
  end
end
