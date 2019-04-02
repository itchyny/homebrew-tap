class Maketen < Formula
  homepage 'https://github.com/itchyny/maketen-go'
  version '0.0.1'
  url 'https://github.com/itchyny/maketen-go/releases/download/v0.0.1/maketen_darwin_amd64.zip'
  sha256 '7f9ddaa706eb2f6661849cbcaa378380be9068af59e262c5a73b49044f0742f7'

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
