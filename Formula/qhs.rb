class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.3.0'
  url 'https://github.com/itchyny/qhs/releases/download/v0.3.0/qhs_v0.3.0_darwin_amd64.zip'
  sha256 '1d7d9bce58a7e8df3e12a2e99b3e65175c977971bfe607bc7dbf722edb42d0b7'

  def install
    bin.install 'qhs'
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
