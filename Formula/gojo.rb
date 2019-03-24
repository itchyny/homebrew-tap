class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.0.5'
  url 'https://github.com/itchyny/gojo/releases/download/v0.0.5/gojo_darwin_amd64.zip'
  sha256 '1bd7eb9b93bad59a98177b2cc6bd6a962ec00d11a2b66ad3bdc97004094a11ff'

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
