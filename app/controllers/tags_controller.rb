class TagsController < ApplicationController
  
  def search
    @model = Book
    @content = params[:content]
    @books = Book.where("tag LIKE?","%#{@content}%")
    render "tags/index"
  end

end
