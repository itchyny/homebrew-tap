class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.2.0'
  url 'https://github.com/itchyny/gojq/releases/download/v0.2.0/gojq_v0.2.0_darwin_amd64.zip'
  sha256 '2ab24fcd9cddaf8b56fe7f4550bc344c699c586d11c76d3288926d070cce8e29'

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
