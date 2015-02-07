class AccountplansController < BaseApiController
  before_filter :find_organisation
  before_filter :find_accountplan, only: [:show, :update]

  before_filter only: :update do
    unless @json.has_key?('accountplan')
      render nothing: true, status: :bad_request
    end
  end

  def index
    render json: AccountPlan.where(organisation_id: @org.id)
  end

  def show
    render :json => @accountplan, :include => {:accounts => {}}
  end

  def create
    @accountplan = AccountPlan.new
    @accountplan.update_attributes(@json['accountplan'])
    @org.account_plans << @accountplan
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
  def find_organisation
    @org = Organisation.find_by(name: params[:organisation_id])
    unless @org
      render nothing: true, status: :not_found
    end
  end

  def find_accountplan
    begin
      @accountplan = AccountPlan.find_by(organisation_id: @org.id, name: params[:id])
    rescue
      render nothing: true, status: :not_found
    end
  end
end

