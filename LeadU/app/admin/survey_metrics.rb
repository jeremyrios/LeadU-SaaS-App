ActiveAdmin.register SurveyMetrics do
  index do
    column :name
    column :question
    column :total
    column :hits
    column :accuracy
  end
end
