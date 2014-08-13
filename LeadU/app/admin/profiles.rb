ActiveAdmin.register Profile do
  form do |f|
    f.inputs "Content" do
      f.input :step_1
      f.input :step_2
      f.input :step_3
      f.input :step_4
      f.input :step_5
      f.input :body
      f.input :video_link
      f.input :personality_type
    end
    f.actions
  end
end
