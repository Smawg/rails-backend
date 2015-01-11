class AccountplansController < BaseApiController
  before_filter :find_accountplan, only: [:show, :update]

  before_filter only: :update do
    unless @json.has_key?('accountplan')
      render nothing: true, status: :bad_request
    end
  end

  def index
    render json: AccountPlan.all
  end

  def show
    render json: @account
  end

  def create
    @accountplan = AccountPlan.new
    @accountplan.update_attributes(@json['accountplan'])
    if @accountplan.save
      render json: @accountplan
    else
      render nothing: true, status: :bad_request
    end
  end

  def update
    @accountplan.update_attributes(@json['accountplan'])
    if @accountplan.save
      render json: @accountplan
    else
      render nothing: true, status: bad_request
    end
  end

private
  def find_accountplan
    begin
      @accountplan = AccountPlan.find(params[:id])
    rescue
      render nothing: true, status: :not_found
    end
  end
end

