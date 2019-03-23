class Maketen < Formula
  homepage 'https://github.com/itchyny/maketen-go'
  version '0.0.0'
  url 'https://github.com/itchyny/maketen-go/releases/download/v0.0.0/maketen_darwin_amd64.zip'
  sha256 '39314539d603294196f335a458071e8dbbab106b90578589742416e1bde8c6f9'

  head do
    url 'https://github.com/itchyny/maketen-go.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
      bin.install 'build/maketen'
    else
      bin.install 'maketen'
    end
  end

  test do
    system "#{bin}/maketen", '-v'
  end
end
