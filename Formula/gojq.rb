class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.11.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.11.0/gojq_v0.11.0_darwin_amd64.zip'
  sha256 'dab8b30378e926d18848e0d98edc56855263da15c456ead8f7e1fd609176d3fa'

  head do
    url 'https://github.com/itchyny/gojq.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gojq'
    zsh_completion.install "_gojq"
  end

  test do
    system "#{bin}/gojq", '--version'
  end
end
