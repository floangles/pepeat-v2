ActiveAdmin.register Meal do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#

permit_params :home_hour, :home, :starter, :main, :dessert, :price, :title, :portion, :description, :start_hour, :end_hour, :day, :picture, :takeaway

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
