class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    search_term = params[:q]
    if params[:q]
      @products = Product.where("LOWER(name)LIKE? OR LOWER(description)LIKE?", "%#{search_term.downcase}%", "%#{search_term.downcase}")
    else
      @products = Product.all
    end 
  end
  

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC")
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)
   
    respond_to do |format|
      if @product.save
        format.html { redirect_to "/products", notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @products.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :text, :image_url, :colour, :price)
    end
    
    
end
