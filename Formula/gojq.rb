class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.7.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.7.0/gojq_v0.7.0_darwin_amd64.zip'
  sha256 '908a3571282f7114c7e1cad29e7d53d5db81cbc04efdd21b064acb8cf8551caf'

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
