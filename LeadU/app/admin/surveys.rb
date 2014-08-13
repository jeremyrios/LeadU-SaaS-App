ActiveAdmin.register Survey do

  scope :all, :default => true
  scope :fa2013 do |s|
    if(User.where(:code => 'fa2013').exists?)
      fID = User.where(:code => 'fa2013').first.id
      s.includes(:user, {user: :follows}).where('follows.followable_id' => fID)
    else
      s.where(:id => 0)
    end
  end  

  
  index do
    selectable_column
    column :id
    column :user
    column :first_name do |resource|
     resource.user.first_name
    end
    column :last_name do |resource|
      resource.user.last_name
    end
    column :created_at
    column :ei
    column :sn
    column :tf
    column :jp
    column :personality_type
    column :group do |r|
      groupedBool = r.user.follows.first
      if(groupedBool)
        User.find_by_id(r.user.follows.first.followable_id).code
      end    
    end
      
    default_actions
  end 

  form do |f|
    f.inputs "Details" do
      f.input :ei
      f.input :tf
      f.input :sn
      f.input :jp
      f.input :personality_type
      f.input :user_id
    end
    f.actions
  end
end
