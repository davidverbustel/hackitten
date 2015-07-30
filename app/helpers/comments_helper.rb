module CommentsHelper
  def pluralize_comment(count, singular, plural = nil)
    word = if (count == 0 || count == 1 || count =~ /^1(\.0+)?$/)
      singular
    else
      plural || singular.pluralize
    end

    "#{count || 0} #{word}"
  end
end
