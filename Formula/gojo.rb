class Gojo < Formula
  homepage 'https://github.com/itchyny/gojo'
  version '0.1.0'
  url 'https://github.com/itchyny/gojo/releases/download/v0.1.0/gojo_v0.1.0_darwin_amd64.zip'
  sha256 'bd6811115564b10403ce5d87acf7487f3af5dc8e59d40b75fed32eeafd8dc961'

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
