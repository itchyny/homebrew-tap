class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.6.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.6.0/gojq_v0.6.0_darwin_amd64.zip'
  sha256 'b9982593335a2cf2eec72f401ca987b09af5f3f44e67acbfb2b3b827c88dc6de'

  head do
    url 'https://github.com/itchyny/gojq.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gojq'
  end

  test do
    system "#{bin}/gojq", '-v'
  end
end
