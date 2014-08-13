module UsersHelper

     def auth_user
       redirect_to root_path, notice: "Please sign in." unless signed_in?
     end
     
end
