ActiveAdmin.register ChiefPicture do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
show do
    attributes_table do
      row :image do
        image_tag chief_picture.chiefpicture.url(:medium)
      end
      row :id
      row :created_at
      row :chiefpicture_file_size
      row :chiefpicture_updated_at
    end
    active_admin_comments
  end

index do
    selectable_column

    column :id
    column :created_at
    column :chiefpicture_file_size
    column :chiefpicture_updated_at
    actions

  end

end
