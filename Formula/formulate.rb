class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.7'
  url 'https://github.com/itchyny/formulate/archive/v0.0.7.zip'
  sha256 '96e1fb261c0858ca8f5087de8c37ec954785ad0447b25ff7cdd3ced6d8b52741'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
