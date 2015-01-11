class AccountsController < BaseApiController
  before_filter :find_account, only: [:show, :update]

  before_filter only: :update do
    unless @json.has_key?('account')
      render nothing: true, status: :bad_request
    end
  end

  def show
    render json: @account
  end

  def create
    @account = Account.new
    @account.assign_attributes(@json['account'])
    if @account.save
      render json: @account
    else
      render nothing: true, status: :bad_request
    end
  end

  def update
    @account.assign_attributes(@json['account'])
    if @account.save
      render json: @account
    else
      render nothing: true, status: bad_request
    end
  end

private
  def find_account
    begin
      @account = Account.find(params[:account])
    rescue
      render nothing: true, status: :not_found
    end
  end
end
