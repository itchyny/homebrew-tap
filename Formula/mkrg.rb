class Mkrg < Formula
  homepage 'https://github.com/itchyny/mkrg'
  version '0.0.2'
  url 'https://github.com/itchyny/mkrg/releases/download/v0.0.2/mkrg_v0.0.1_darwin_amd64.zip'
  sha256 '0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'

  head do
    url 'https://github.com/itchyny/mkrg.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/mkrg'
    else
      bin.install 'mkrg'
    end
  end

  test do
    system "#{bin}/mkrg", '--version'
  end
end
