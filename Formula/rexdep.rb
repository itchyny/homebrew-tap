class Rexdep < Formula
  homepage 'https://github.com/itchyny/rexdep'
  version '0.3.0'

  if OS.mac?
    url 'https://github.com/itchyny/rexdep/releases/download/v0.3.0/rexdep_v0.3.0_darwin_amd64.zip'
    sha256 '3256b7bac2745245fc5e44430d268ce9bc255a793d8e3d03dd86e3d37e1db5df'
  elsif OS.linux?
    url 'https://github.com/itchyny/rexdep/releases/download/v0.3.0/rexdep_v0.3.0_linux_amd64.tar.gz'
    sha256 'f1fad054ffb12fbfa7fb85ef74d6d9f4a24b5adc077ba20a74fa4cf60424f710'
  end

  head do
    url 'https://github.com/itchyny/rexdep.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'rexdep'
  end

  test do
    system "#{bin}/rexdep", '--version'
  end
end
