class Gojq < Formula
  homepage 'https://github.com/itchyny/gojq'
  version '0.11.1'

  if OS.mac?
    url 'https://github.com/itchyny/gojq/releases/download/v0.11.1/gojq_v0.11.1_darwin_amd64.zip'
    sha256 '5d494770e6299303dda90e7faaf7e9b4dd03e5813609d154f2544e26e7cf1a38'
  elsif OS.linux?
    url 'https://github.com/itchyny/gojq/releases/download/v0.11.1/gojq_v0.11.1_linux_amd64.tar.gz'
    sha256 '42a5ba7fbfc082285fff7a326018a9c979105377420554a3af2308aa86681f28'
  end

  head do
    url 'https://github.com/itchyny/gojq.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'gojq'
    zsh_completion.install "_gojq"
  end

  test do
    system "#{bin}/gojq", '--version'
  end
end
