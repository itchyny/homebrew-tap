class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.3'
  url 'https://github.com/itchyny/formulate/archive/v0.0.3.zip'
  sha256 '129522441f4eb3e7f52df979e04dd129dc86c48444027b3e6325ba21188a722d'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
