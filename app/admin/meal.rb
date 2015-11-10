ActiveAdmin.register Meal do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#

index do
    selectable_column
    column :id
    column :title
    column :starter
    column :main
    column :dessert
    column :price
    column :portion
    column :home
    column :takeaway
    column :created_at
    column :validation
    column :admin
    actions

  end

permit_params :ingredients, :start_hour_home, :user_id, :validation, :home_hour, :home, :starter, :main, :dessert, :price, :price_cents, :title, :portion, :description, :start_hour, :end_hour, :day, :picture, :takeaway

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
