class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.4.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.4.0/gojq_v0.4.0_darwin_amd64.zip'
  sha256 'f3bb4af3449cb0dda251811c26022bcfaae0d8e89998112fc9e59a110be2567d'

  head do
    url 'https://github.com/itchyny/gojq.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/gojq'
    else
      bin.install 'gojq'
    end
  end

  test do
    system "#{bin}/gojq", '-v'
  end
end
