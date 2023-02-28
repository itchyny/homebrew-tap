class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.11'
  url 'https://github.com/itchyny/formulate/archive/v0.0.11.zip'
  sha256 'ca3acee47faf4599292c2e86b2a820665ebe5a3bafd202057b0578110d1faa26'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
