class Mmv < Formula
  homepage 'https://github.com/itchyny/mmv'
  version '0.1.0'
  url 'https://github.com/itchyny/mmv/releases/download/v0.1.0/mmv_v0.1.0_darwin_amd64.zip'
  sha256 '3db7c868d9600547f091a07f072297977ea109f9cca53218863be9a8ef3c98cb'

  head do
    url 'https://github.com/itchyny/mmv.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mmv'
  end

  test do
    system "#{bin}/mmv", '--version'
  end
end
