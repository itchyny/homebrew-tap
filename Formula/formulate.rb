class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.5'
  url 'https://github.com/itchyny/formulate/archive/v0.0.5.zip'
  sha256 'df9f94d77200f595930728039ea213f4c91030899d96abadd8ee903fbfc77427'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
