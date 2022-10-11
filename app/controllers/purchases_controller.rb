class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /purchases or /purchases.json
  def index
    @category = Category.find(params['category_id'])
    @purchases = Purchase.where(author_id: current_user.id, category_id: params['category_id']).order(created_at: :desc)
    @total_price = @purchases.sum(:amount)
  end

  # GET /purchases/1 or /purchases/1.json
  def show; end

  # GET /purchases/new
  def new
    @category = Category.find(params['category_id'])
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit; end

  # POST /purchases or /purchases.json
  def create
    @category = Category.find(params['category_id'])
    @purchase = Purchase.new(purchase_params)
    @purchase.author_id = current_user.id
    @purchase.category_id = params['category_id']

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to category_purchases_path(@purchase), notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    set_purchase
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to category_purchase_path(@purchase), notice: 'Purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @category = Category.find(params['category_id'])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to category_purchase_path(@category), notice: 'Purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:name, :amount, :user_id, :category_id)
  end
end
