class Pihex < Formula
  homepage 'https://github.com/itchyny/pihex-rs'
  version '0.1.3'
  url 'https://github.com/itchyny/pihex-rs/releases/download/v0.1.3/pihex_darwin.zip'
  sha256 '257c740f408426f32c931214b59bd53bb45005cda9974b8c77a4aeb22ded91d7'
  head 'https://github.com/itchyny/pihex-rs.git'

  def install
    bin.install 'pihex'
  end

  test do
    system "#{bin}/pihex", '--version'
  end
end
