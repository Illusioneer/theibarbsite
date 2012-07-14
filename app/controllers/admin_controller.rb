class AdminController < ApplicationController

  before_filter :require_auth
  
  def index
    #@menu_data = 
    @user_data = User.all
  end

  def useradmin
    #@menu_data =
    #--user admin function -- should be in it's own controller'
    @user_data = User.all
  end

  def contentadmin
    #@menu_data =
    #-- not about creating content but settings pertaining to the content page
    #
    #--comments functions
    @user_data = User.all
  end

  def contenttypes
    #@menu_data =
    @user_data = User.all
  end

  def systemadmin
    #@menu_data =
    #--permissions assignment
    #--rss functions
    #--permalinks
    #--site setting function
    @user_data = User.all
  end
  
end

# -- search admin func db based on user id
# -- 
#module process: 1) see if registered in module collection, 2) check if module's individual collection exists, 3) if not run init functions for that module
#
#
#
#
#
#
