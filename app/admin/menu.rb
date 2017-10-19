ActiveAdmin.register Menu do

  permit_params :name, :restaurant_id
  before_create do |menu|
    binding.pry
    menu.restaurant_id = current_admin_user.restaurants
  end
  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :restaurant_id, sortable: :restaurant_id
    actions
  end
end
