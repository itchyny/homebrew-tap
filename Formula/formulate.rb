class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.8'
  url 'https://github.com/itchyny/formulate/archive/v0.0.8.zip'
  sha256 '71387152a200ef1a230cbb01ecec577c4b0545e2488d0fcadf585bab31cd07e5'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
