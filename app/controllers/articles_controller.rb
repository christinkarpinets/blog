require 'will_paginate'
class ArticlesController < ApplicationController
  def index
    if params[:search].present?
      @articles = Article.search_by_starts_with(params[:search]).paginate(page: params[:page], per_page: 2)
      return
    end
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end


  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end