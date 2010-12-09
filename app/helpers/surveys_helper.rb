module SurveysHelper
  def survey_question_stats(question, join_str='<br>')
    possible_options = {}
    all_answers_count = 0
    question.field_options.split('|').each{ |s| possible_options[s] = 0 }
    for answer in question.survey_answers
      all_answers_count += 1 unless answer.answer.blank?
      if answer.answer.class == Array
        for a in answer.answer
          possible_options[a] += 1
        end
      else
        possible_options[answer.answer]+=1
      end
    end
    possible_options.sort_by{ |k,v| v }.reverse.map{ |k,v| "#{k}: #{v} - #{v/all_answers_count.to_f*100.0}%" }.join(", ")
  end
end
