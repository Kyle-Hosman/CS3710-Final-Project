class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @user = User.find(params[:user_id])
    @item = @user.items.build
  end

  # GET /items/1/edit
  def edit
    @user = @item.user
  end

  # POST /items or /items.json
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(item_params)
    @item.created_at = Time.current # Use current time for created_at
    if @item.save
      redirect_to inventory_path(@user), notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    @user = @item.user
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_path, status: :see_other, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :price, :description, :availability)
    end
end
