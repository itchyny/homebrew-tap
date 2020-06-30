class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.10.4'
  url 'https://github.com/itchyny/gojq/releases/download/v0.10.4/gojq_v0.10.4_darwin_amd64.zip'
  sha256 'e987fe765467975ca5590765cd699c4528cf36e23b7327a8cdab641cf142e3bd'

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
