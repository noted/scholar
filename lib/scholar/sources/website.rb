module Scholar
  class Website < Source
    name "Website"

    sequence [
      :author,
      :title,
      :website,
      :editor,
      :translator,
      :publisher,
      :date,
      :media,
      :accessed,
      :url
    ]

    rules do
      quotes :title
      italicize :website
      carets :url
    end
  end
end
