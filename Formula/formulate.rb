class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.0'
  url 'https://github.com/itchyny/formulate/archive/v0.0.0.zip'
  sha256 '45818d98df640aa58f4e30eb6d448c8802ab4e2895455c483f1503c9cf947fe3'

  def install
    bin.install 'formulate'
  end

  test do
    system "#{bin}/formulate"
  end
end
