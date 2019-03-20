class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.0.4'
  url 'https://github.com/itchyny/gojo/releases/download/v0.0.4/gojo_darwin_amd64.zip'
  sha256 '4f2c24b035bed18d48c72d74009c347b42bdb6e05e6f164a9ea9e0aa3acbc6b7'

  head do
    url 'https://github.com/itchyny/gojo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/gojo'
    else
      bin.install 'gojo'
    end
  end

  test do
    system "#{bin}/gojo", '-v'
  end
end
