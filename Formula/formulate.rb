class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.12'
  url 'https://github.com/itchyny/formulate/archive/v0.0.12.zip'
  sha256 'c0d71e6e5c71852d4e4aa92ba34bdf1c031432c450e876d8fd28d31fd02d0014'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
