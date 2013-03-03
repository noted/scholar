module Scholar
  class MagazineArticle < Source
    name "Magazine Article"

    sequence [
      :author,
      :title,
      :editor,
      :compiler,
      :translator,
      :publisher,
      :date,
      :pages,
      :database,
      :media,
      :accessed,
      :url
    ]

    rules do
      quote :title
      italicize :publisher
      italicize :database
      carets :url
    end
  end
end
