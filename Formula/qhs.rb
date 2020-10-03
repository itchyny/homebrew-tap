class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.3.3'

  if OS.mac?
    url 'https://github.com/itchyny/qhs/releases/download/v0.3.3/qhs_v0.3.3_darwin_amd64.zip'
    sha256 'f833a75462ead44d80a985e2f8246e496c357cb30a40b14decc129742cc38bcb'
  elsif OS.linux?
    url 'https://github.com/itchyny/qhs/releases/download/v0.3.3/qhs_v0.3.3_linux_amd64.zip'
    sha256 '8f5371fd34ecc3205692994c3df4a1f16bfd499cb679161ad7ad1b4606a191c1'
  end

  def install
    bin.install 'qhs'
    zsh_completion.install "_qhs"
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
