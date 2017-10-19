ActiveAdmin.register Menu do

  permit_params :name, :restaurant_id

  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :restaurant_id, sortable: :restaurant_id
    actions
  end

  filter :name
  # filter :admin_user, collection: proc {(AdminUser.all).map{|c| [c.email, c.id]}}, if: proc { authorized? :manage }
  filter :restaurant_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :restaurant_id, as: :select, collection: Restaurant.all.select { |t| [t.name] if current_admin_user.restaurants.ids.any? {|id| id == t.id }}
    end
    f.actions
  end
end
