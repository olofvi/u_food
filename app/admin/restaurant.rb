ActiveAdmin.register Restaurant do

  permit_params :name, :address, :description, :restaurant_category_id, :admin_user_id

end
