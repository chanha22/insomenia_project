class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 5)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @cafe = Cafe.find(params[:id])
  end

  def create
    @cafe=Cafe.find(params[:cafe])
    _title = params[:title]
    _content = params[:content]
    _ratings = params[:ratings]
    _image = params[:image]


    post = Post.new(title: _title, content: _content, ratings: _ratings) ## record / row
    post.user = current_user
    post.cafe = @cafe
    post.image = _image
    post.save

    redirect_to cafes_path(@cafe.id)
  end

  def destroy
    _id = params[:id]

   post = Post.find(_id)
   authorize_action_for post

   restaurant_id = post.cafe.id

   post.destroy

   redirect_to cafe_path(restaurant_id)
  end

  def edit
    _id = params[:id]
   @post = Post.find(_id)

   authorize_action_for @post
  end

  def update
    _id = params[:id]
    _title = params[:title]
    _content = params[:content]
    _ratings = params[:ratings]

    post = Post.find(_id)
    authorize_action_for post

    post.ratings = _ratings
    post.title = _title
    post.content = _content

    if params[:image]
      post.image = params[:image]
    end

    post.save

    redirect_to post_path(post.id)
  end
end
