require 'citeproc'

module Scholar
  class Citation
    attr_accessor :source, :citation, :csl

    def initialize(source, style)
      csl = File.open(File.join(SCHOLAR_ROOT, 'vendor', 'citation-styles', "#{style}.csl")).read

      @csl      = style
      @source   = source
      @citation = CiteProc.process(source, style: csl, format: :html)
    end
  end
end
