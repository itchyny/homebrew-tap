class Formulate < Formula
  homepage 'https://github.com/itchyny/formulate'
  version '0.0.9'
  url 'https://github.com/itchyny/formulate/archive/v0.0.9.zip'
  sha256 'fa335983b6cb59e459fac55a86eb036bcb8c3b6bc3c347b7ee10ae26a6f666f6'

  def install
    bin.install 'formulate'
    zsh_completion.install "_formulate"
  end

  test do
    system "#{bin}/formulate", '--version'
  end
end
