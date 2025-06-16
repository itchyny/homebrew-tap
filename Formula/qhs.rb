class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.4.0'

  if OS.mac?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.0/qhs_v0.4.0_darwin_arm64.zip'
    sha256 'e522a1cb99648ef9880cd4376e2fe6b75bded511289e2bff70b2832ec2d6ec77'
  elsif OS.linux?
    url 'https://github.com/itchyny/qhs/releases/download/v0.4.0/qhs_v0.4.0_linux_amd64.zip'
    sha256 'edfe67507652ffd900318cc40078b950a517ae1c1ad95d6d77178090ccaec622'
  end

  def install
    bin.install 'qhs'
    zsh_completion.install "_qhs"
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
