module CustomUrlsHelper
  def legislation_question_url(question)
    legislation_process_question_url(question.process, question)
  end

  def legislation_annotation_url(annotation)
    legislation_process_question_url(annotation.draft_version.process, annotation.draft_version, annotation)
  end

  def set_class
    ["#f9bd41", "#28bede", "#50c87d", "#f078b4", "#eb6e6e", "#ffe5e6", "#f5af28", "#32c8c8", "#5sdca0", "#f5b9d2", "#f5a5a0", "#fac864", "#78c8c8", "#90dcaa", "#cad296"].sample
  end

end
