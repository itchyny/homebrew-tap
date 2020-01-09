class Mmv < Formula
  homepage 'https://github.com/itchyny/mmv'
  version '0.1.1'
  url 'https://github.com/itchyny/mmv/releases/download/v0.1.1/mmv_v0.1.1_darwin_amd64.zip'
  sha256 '8c2e62795760fa184adee5734f3e0bca85738b13adfa067b212da72f7560cd3f'

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
