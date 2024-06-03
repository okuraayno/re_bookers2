class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @model = "user"
    @content = params[:content]
    @method = params[:method]

    @records = User.search_for(@content, @method)
  end
  
end
