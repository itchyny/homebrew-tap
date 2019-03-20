class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.2.0'
  url 'https://github.com/itchyny/qhs/releases/download/v0.2.0/qhs_darwin.zip'
  sha256 '1324a2dc550d39dc7e2c02dc8bf17d1ae052c7950bdbece57fedf27fea9e024d'

  def install
    bin.install 'qhs'
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
