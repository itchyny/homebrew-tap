class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.1'
  url 'https://github.com/itchyny/formulate/archive/v0.0.1.zip'
  sha256 'eb4d3cdec56d9cd107cb817015eff33ce0a003aebe9d4a975e6e32dcd99f8d49'

  def install
    bin.install 'formulate'
  end

  test do
    system "#{bin}/formulate"
  end
end
