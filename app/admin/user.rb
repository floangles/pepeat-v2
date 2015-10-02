# ActiveAdmin.register User do

# # See permitted parameters documentation:
# # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
# #
# # permit_params :list, :of, :attributes, :on, :model
# #
# # or
# #

# permit_params :firstname, :phone_number, :surname, :lastname, :picture, :email, :address, :description, :chiefpicture
# # permit_params do
# #   permitted = [:permitted, :attributes]
# #   permitted << :other if resource.something?
# #   permitted
# # end


# end


ActiveAdmin.register User do


  show do
    attributes_table do
      row :image do
        image_tag user.picture.url(:medium)
      end
      row :surname
      row :firstname
      row :lastname
      row :phone_number
      row :email
      row :address
      row :chief
    end
    active_admin_comments
  end

  index do
    selectable_column
    column :id
    column :email
    column :surname
    column :firstname
    column :lastname
    column :chief
    column :created_at
    column :admin
    actions

  end
  form do |f|
    f.inputs "Identity" do
      f.input :surname
      f.input :firstname
      f.input :lastname
      f.input :address
      f.input :picture
      f.input :phone_number
      f.input :email
      f.input :description
      f.input :chief

    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end

  permit_params :admin, :chief, :firstname, :phone_number, :surname, :lastname, :picture, :email, :address, :description, :chiefpicture
end
