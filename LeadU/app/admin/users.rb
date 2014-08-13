ActiveAdmin.register User do

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column :created_at
    column :survey
    column :Professors_Code do |p|
       p.code
    end
    column :group do |r|
      groupedBool = r.follows.first
      if(groupedBool)
        User.find_by_id(r.follows.first.followable_id).code
      end    
    end
    default_actions
  end 

  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
