class Rexdep < Formula
  homepage 'https://github.com/itchyny/rexdep'
  version '0.3.0'
  url 'https://github.com/itchyny/rexdep/releases/download/v0.3.0/rexdep_v0.3.0_darwin_amd64.zip'
  sha256 '3256b7bac2745245fc5e44430d268ce9bc255a793d8e3d03dd86e3d37e1db5df'

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
