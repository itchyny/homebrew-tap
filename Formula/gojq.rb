class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.5.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.5.0/gojq_v0.5.0_darwin_amd64.zip'
  sha256 '9cb42f163e7a37ec775bdb06cb594c3c2b917672a4d9df17a1c0fb2d5389e653'

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
