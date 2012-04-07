class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json

  before_filter :require_auth, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
      format.atom { render :action=>'index',:layout=>false }
      format.rss { render :layout => false }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    params[:article]['tags'] = params[:article]['tags'].split(',')
    params[:author] = current_user.user_id
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    params[:article]['tags'] = params[:article]['tags'].split(',')
    params[:author] = current_user.user_id
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end
  end
  def feed
    @posts = Post.all(:select => "title, author, id, content, posted_at", :order => "posted_at DESC", :limit => 20) 

    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end
  end
end

 
 # FEED makes the feed for rss  
def feed
    @articles = Article.all

    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end
end

