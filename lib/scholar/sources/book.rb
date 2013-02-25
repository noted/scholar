module Scholar
  class Book < Source
    @@sequence = [
      :author,
      :title,
      :editor,
      :compiler,
      :translator,
      :edition,
      :volume,
      :city,
      :publisher,
      :year,
      :media,
      :series
    ]
  end
end
