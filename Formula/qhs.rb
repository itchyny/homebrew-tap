class Qhs < Formula
  homepage 'https://github.com/itchyny/qhs'
  version '0.2.1'
  url 'https://github.com/itchyny/qhs/releases/download/v0.2.1/qhs_darwin.zip'
  sha256 'd82641b21f651675e37d231e084c313060fbb9da71de2a01a8abd4ad99a04ea7'

  def install
    bin.install 'qhs'
  end

  test do
    system "#{bin}/qhs", '--version'
  end
end
