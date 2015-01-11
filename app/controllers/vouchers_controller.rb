class VouchersController < BaseApiController
  before_filter :find_voucher, only: [:show, :update]

  before_filter only: :update do
    unless @json.has_key?('voucher')
      render nothing: true, status: :bad_request
    end
  end

  def index
#    @vouchers = Voucher.all
    render json: Voucher.all
  end

  def show
    render :json => @voucher, :include => {:voucher_rows => {}}
  end

  def create
    @voucher = Voucher.new
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
      render nothing: true, status: bad_request
    end
  end

private
  def find_voucher
    begin
      @voucher = Voucher.find(params[:id])
    rescue
      render nothing: true, status: :not_found
    end
  end
end
