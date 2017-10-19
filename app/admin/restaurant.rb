ActiveAdmin.register Restaurant do

  permit_params :name, :address, :description, :latitude, :longitude, :restaurant_category, :admin_user


  # index do
  #   column :name
  #   column '' do |post|
  #     link_to 'Edit', admin_restaurants_path(post) if authorized? :update, post
  #   end
  # end

  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :address, sortable: :address
    column :restaurant_category, sortable: :restaurant_category
    column :admin_user, sortable: :admin_user if authorized? :manage
    column :description, sortable: :description
    column :latitude
    column :longitude
    actions
  end

  filter :name
  filter :address
  filter :restaurant_category
  filter :admin_user
  filter :description

end
