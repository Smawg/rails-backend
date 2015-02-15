class VouchersController < BaseApiController
  before_filter :find_organisation
  before_filter :find_year
  before_filter :find_voucher, only: [:show, :update]

  before_filter only: :update do
    unless @json.has_key?('voucher')
      render nothing: true, status: :bad_request
    end
  end

  def index
      render json: @year.vouchers
  end

  def show
    render :json => @voucher, :include => {:voucher_rows => {}}
  end

  def create
    @voucher = Voucher.new
    @year.vouchers << @voucher
    @voucher.update_attributes(@json['voucher'])

    if @voucher.save
      render json: @voucher
    else
      render nothing: true, status: :bad_request
    end
  end

  def update
    @voucher.update_attributes(@json['voucher'])
    if @voucher.save
      render json: @voucher
    else
      render nothing: true, status: :bad_request
    end
  end

private
  def find_organisation
    @org = Organisation.findByName(params[:organisation_id])
    unless @org
      render nothing: true, status: :not_found
    end
  end

  def find_year
    @year = BusinessYear.findByYear(@org.id, params[:businessyear_id])
    unless @year
      render nothing: true, status: :not_found
    end
  end

  def find_voucher
    @voucher = Voucher.findByNumber(@year.id, params[:id])
    unless @year
      render nothing: true, status: :not_found
    end
  end
end
