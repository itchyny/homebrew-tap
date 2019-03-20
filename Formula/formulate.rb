class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.2'
  url 'https://github.com/itchyny/formulate/archive/v0.0.2.zip'
  sha256 '288759b2c47566687ecac93590d360c1a0068a9a12af7f27b3c472e82461e83a'

  def install
    bin.install 'formulate'
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
