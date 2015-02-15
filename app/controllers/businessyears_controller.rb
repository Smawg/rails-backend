class BusinessyearsController < BaseApiController
  before_filter :find_organisation

  before_filter :find_businessyear, only: [:show, :update]

  before_filter only: :update do
    unless @json.has_key?('businessyear')
      render nothing: true, status: :bad_request
    end
  end

  def index
    render json: BusinessYear.where(organisation_id: @org.id)
  end

  def show
    render json: @year
  end

  def create
    @year = BusinessYear.new
    #@year.update_attributes(@json['businessyear'])
    @year.year = @json['businessyear']['year']
    @year.year_start = @json['businessyear']['year_start']
    @year.year_end = @json['businessyear']['year_end']
    @year.accountplan_id = AccountPlan.findByName(@org.id, @json['businessyear']['accountplan_id']).id

    @org.business_years << @year
    if @year.save
      render json: @year
    else
      render nothing: true, status: :bad_request
    end
  end

  def update
    @year.update_attributes(@json['businessyear'])
    if @year.save
      render json: @year
    else
      render nothing: true, status: bad_request
    end
  end

private
  def find_organisation
    @org = Organisation.findByName(params[:organisation_id])
    unless @org
      render nothing: true, status: :not_found
    end
  end

  def find_businessyear
    begin
      @year = BusinessYear.findByYear(@org.id, params[:id])
    rescue
      render nothing: true, status: :not_found
    end
  end
end

