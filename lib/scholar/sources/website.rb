module Scholar
  module Sources

    # A normal website.
    class Website < Scholar::Source
      sequence [
        :authors,
        :title,
        :website,
        :editors,
        :translators,
        :publisher,
        :date,
        :media,
        :accessed,
        :url
      ]

      rules do
        rule(:authors) {|v| period(v) }

        rule(:title) {|v| period(v) }
        rule(:title) {|v| quotes(v) }

        rule(:website) {|v| italicize(v) }
        rule(:website) {|v| period(v) }

        rule(:editors) {|v| replace("Ed. #{v}") }
        rule(:editors) {|v| period(v) }

        rule(:translators) {|v| replace("Trans. #{v}") }
        rule(:translators) {|v| period(v) }

        rule(:publisher) {|v| comma(v) }

        rule(:date) {|v| date(v, "%-d %b. %Y") }
        rule(:date) {|v| period(v) }

        rule(:media) {|v| replace("Web") }
        rule(:media) {|v| period(v) }

        rule(:accessed) {|v| date(v, "%-d %b. %Y") }
        rule(:accessed) {|v| period(v) }

        rule(:url) {|v| carets(v) }
        rule(:url) {|v| period(v) }
      end
    end
  end
end
