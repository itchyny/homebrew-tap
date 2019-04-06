class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.0.7'
  url 'https://github.com/itchyny/gojo/releases/download/v0.0.7/gojo_v0.0.7_darwin_amd64.zip'
  sha256 '2af8c223eb2ad6ec81c318cc9ab4a9e51f9342c6b78bbc42de6b8633d9831bd3'

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
    zsh_completion.install "_gojo"
  end

  test do
    system "#{bin}/gojo", '-v'
  end
end
