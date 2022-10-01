class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index] 
  # GET /services
  def index
    @posts = Post.all

    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  # GET /services/1
  def show
  end

  # GET /services/new
  def new
    @post = Post.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  def create
    @post = Post.new(post_params)

    @post.user = current_user if current_user

    if @post.save
      redirect_to posts_path
      flash[:notice] = "Tu mini historia ha sido creada exitosamente."
    else
      flash[:notice] = "El no pudo ser creado."
      render :new
    end
  end

  # PATCH/PUT /services/1
  def update
    if @post.update(post_params)
      redirect_to post_path
      flash[:notice] = "Tu mini historia ha sido actualizada exitosamente."
    else
      render :edit
    end
  end

  def destroy
   @post.destroy
   redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :author, :content, :user_id)
    end
end
