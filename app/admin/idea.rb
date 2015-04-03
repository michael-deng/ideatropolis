ActiveAdmin.register Idea do


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

  index do
    id_column
    column :title
    column :content
    actions
  end

  form do |f|
    f.inputs "Idea information" do
      f.input :title
      f.input :content
    end
    f.actions
  end
end
