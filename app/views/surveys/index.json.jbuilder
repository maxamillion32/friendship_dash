json.array!(@surveys) do |survey|
  json.extract! survey, :id, :group, :orderer, :survey_type, :language, :data_label, :content, :response0, :response0_value, :response1, :response1_value, :response2, :response2_value, :response3, :response3_value, :response4, :response4_value, :response5, :response5_value, :response6, :response6_value, :response7, :response7_value, :response8, :response8_value, :response9, :response9_value, :response10, :response10_value, :response11, :response11_value, :response12, :response12_value, :response13, :response13_value, :response14, :response14_value, :response15, :response15_value, :response16, :response16_value, :required
  json.url survey_url(survey, format: :json)
end
