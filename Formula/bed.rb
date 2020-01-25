class Bed < Formula
  homepage 'https://github.com/itchyny/bed'
  version '0.1.0'
  url 'https://github.com/itchyny/bed/releases/download/v0.1.0/bed_v0.1.0_darwin_amd64.zip'
  sha256 '6bc03a0d613c15e536e6af518c467a4744e0479de1e738c19aee4579c161c3bb'

  head do
    url 'https://github.com/itchyny/bed.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'bed'
  end

  test do
    system "#{bin}/bed", '--version'
  end
end
