require 'citeproc'

module Scholar
  class Citation
    def initialize(*args)
      style = File.open(File.join(SCHOLAR_ROOT, 'vendor', 'citation-styles', 'modern-language-association.csl')).read

      return CiteProc.process(args, style: style, format: :html)
    end
  end
end
