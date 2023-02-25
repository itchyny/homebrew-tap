class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.10'
  url 'https://github.com/itchyny/formulate/archive/v0.0.10.zip'
  sha256 '5b12b5918742299b3dddc592766f58040515c552daef0393cf476c2d88ec2012'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
