class AdminController < ApplicationController
  
  def index
    #@menu_data = 
    @user_data = User.all
  end  
  
end



#functions
#--user admin function
#--site admin function 
#--node admin function
#--permissions assignment
#--rss functions
#--permalinks
#--comments functions

#admin(func_name, inputs)


# -- search admin func db based on user id
# -- 
#module process: 1) see if registered in module collection, 2) check if module's individual collection exists, 3) if not run init functions for that module
#
#
#
#
#
#
