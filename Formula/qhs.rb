class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.4.1'

  if OS.mac?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.1/qhs_v0.4.1_darwin_arm64.zip'
    sha256 '4f47d99175cf24600db8772a55e3dc07abf679c0b7948645617545fc19fae004'
  elsif OS.linux?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.1/qhs_v0.4.1_linux_amd64.zip'
    sha256 'c4361fb15a3f8966616d0b9cae840ee59329a47de9daafd2974eae0233e8b963'
  end

  def install
    bin.install 'qhs'
    zsh_completion.install "_qhs"
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
