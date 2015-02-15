class OrganisationsController < BaseApiController
  before_filter :find_organisation, only: [:show, :update]

  before_filter only: :update do
    unless @json.has_key?('organisation')
      render nothing: true, status: :bad_request
    end
  end

  def index
    render json: Organisation.all
  end

  def show
    render :json => @org, :include => {:account_plans => {}, :business_years => {}}
  end

  def create
    @org = Organisation.new
    @org.update_attributes(@json['organisation'])
    if @org.save
      render json: @org
    else
      render nothing: true, status: :bad_request
    end
  end

  def update
    @org.update_attributes(@json['organisation'])
    if @org.save
      render json: @org
    else
      render nothing: true, status: bad_request
    end
  end

private
  def find_organisation
    @org = Organisation.findByName(params[:id])
    unless @org
      render nothing: true, status: :not_found
    end
  end
end


