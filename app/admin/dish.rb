ActiveAdmin.register Dish do

  permit_params :name, :description, :price, :pic_url, :dish_category_id, :restaurant_id

  index do
    selectable_column
    id_column
    column :name, sortable: :name
    column :description, sortable: :description
    column :price, sortable: :price
    column :pic_url, sortable: :pic_url
    column :dish_category, sortable: :dish_category, as: :select, collection: DishCategory.all.select { |t| [t.name] }
    column :restaurant, sortable: :restaurant
    actions
  end

  filter :name
  filter :description
  filter :price
  filter :dish_category_id, as: :select, collection: DishCategory.all.select { |t| [t.name] }
  filter :restaurant_id, as: :select, collection: Restaurant.all.select { |t| [t.name] }
  filter :menus, as: :select, collection: Menu.all.select { |t| [t.name] }

  form do |f|
    f.inputs do
      f.input :name
      if current_admin_user.super_admin?
        f.input :restaurant_id, as: :select, collection: Restaurant.all.select { |t| [t.name] }
      else
        f.input :restaurant_id, as: :select, collection: Restaurant.all.select { |t| [t.name] if current_admin_user.restaurants.ids.any? {|id| id == t.id } }
      end
      f.input :menu_lines, as: :select, collection: Menu.all.select { |t| [t.name] }
      f.input :price
      f.input :dish_category_id, as: :select, collection: DishCategory.all.select { |t| [t.name] }
      f.input :pic_url
      f.input :description
    end
    f.actions
  end
end
