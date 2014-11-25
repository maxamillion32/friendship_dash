json.array!(@groups) do |group|

    json.group_name group.group_name

    json.surveys do
        json.array! group.surveys do |survey|

            json.survey survey.survey_name
            json.position survey.survey_collections.where(group_id: group.id).first.position
            json.guid survey.guid

            json.survey_questions do
                json.array! survey.survey_questions do |survey_question|
                    json.guid survey_question.guid
                    json.orderer survey_question.orderer
                    json.type survey_question.survey_type
                    json.language survey_question.language
                    json.data_label survey_question.data_label
                    json.content survey_question.content
                    json.required survey_question.required
                    json.response0 survey_question.response0
                    json.response0_value survey_question.response0
                    json.response1 survey_question.response1
                    json.response1_value survey_question.response1
                    json.response2 survey_question.response2
                    json.response2_value survey_question.response2
                    json.response3 survey_question.response3
                    json.response3_value survey_question.response3
                    json.response4 survey_question.response4
                    json.response4_value survey_question.response4
                    json.response5 survey_question.response5
                    json.response5_value survey_question.response5
                    json.response6 survey_question.response6
                    json.response6_value survey_question.response6
                    json.response7 survey_question.response7
                    json.response7_value survey_question.response7
                    json.response8 survey_question.response8
                    json.response8_value survey_question.response8
                    json.response9 survey_question.response9
                    json.response9_value survey_question.response9
                    json.response10 survey_question.response10
                    json.response10_value survey_question.response10
                    json.response11 survey_question.response11
                    json.response11_value survey_question.response11
                    json.response12 survey_question.response12
                    json.response12_value survey_question.response12
                    json.response13 survey_question.response13
                    json.response13_value survey_question.response13
                    json.response14 survey_question.response14
                    json.response14_value survey_question.response14
                    json.response15 survey_question.response15
                    json.response15_value survey_question.response15
                    json.response16 survey_question.response16
                    json.response16_value survey_question.response16
                end
            end
        end
    end
end
