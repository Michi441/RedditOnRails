module SubmissionsHelper


  def CommentPlural(number)
    if number > 1
      "Comments"
    else
      "Comment"
    end
  end
end
