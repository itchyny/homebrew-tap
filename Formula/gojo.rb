class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.0.6'
  url 'https://github.com/itchyny/gojo/releases/download/v0.0.6/gojo_darwin_amd64.zip'
  sha256 '5112e9b4a0fd5a0a53f1896beac77f89022bc513ed9b2342c1742c93f1baad81'

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
