class WordsController < ApplicationController
  
  before_action :set_word, only: [:show, :edit, :update, :destroy] 
  
  def index
    @words = Word.all
  end
  
  def new
    if params[:back]
      @word = Word.new(word_params)
    else
      @word = Word.new
    end
  end
  
  def create
    @word = Word.new(word_params)
    if @word.save
      redirect_to words_path, notice: "つぶやきを作成しました！"
    else
      render 'new'
    end
  end
  
  def edit
    #@word = Word.find(params[:id])
  end
  
  def show
     #@word = Word.find(params[:id])
  end
  
  def update
     #@word = Word.find(params[:id])
    if @word.update(word_params)
      redirect_to words_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @word.destroy
    redirect_to words_path, notice:"つぶやきを削除しました！"
  end
  
  def confirm
    @word = Word.new(word_params)
    render :new if @word.invalid?
  end
  
  private
  def word_params
    params.require(:word).permit(:content)
  end
  
  def set_word
    @word = Word.find(params[:id])
  end
  
end
  
