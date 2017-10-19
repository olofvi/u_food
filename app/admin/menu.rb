ActiveAdmin.register Menu do

  permit_params :name, :restaurant_id

  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :restaurant_id, sortable: :restaurant_id
    actions
  end
end
