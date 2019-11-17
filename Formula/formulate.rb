class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.6'
  url 'https://github.com/itchyny/formulate/archive/v0.0.6.zip'
  sha256 'db3c16e3340802a4f29fba9bf27645c30a54d34c58b7d6009c0a1de720746163'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
