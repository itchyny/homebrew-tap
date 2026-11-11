class Aws3 < Formula
  desc 'Fast command compatible with aws s3'
  homepage 'https://github.com/itchyny/aws3'
  version '0.3.0'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/aws3/releases/download/v0.3.0/aws3-v0.3.0-aarch64-apple-darwin.zip'
      sha256 '81f07bec9941a6ed118a91a882210884e632d8b4ed6e2a274ec6c19d40bfb30b'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/aws3/releases/download/v0.3.0/aws3-v0.3.0-x86_64-apple-darwin.zip'
      sha256 'c89c41ffdd4f5194e2d31d4030cf50170d449b54910bd2172484f11a3cdb56b9'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/aws3/releases/download/v0.3.0/aws3-v0.3.0-aarch64-unknown-linux-gnu.zip'
      sha256 '1816c6b4280dc507c68cf090c08d055fb67f6e04a91fbdadf6bf433d83459ef5'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/aws3/releases/download/v0.3.0/aws3-v0.3.0-x86_64-unknown-linux-gnu.zip'
      sha256 '10809a017a0c6e6216c21afac0a4b122aaa6723835bef67f3b73c14dc0dc725e'
    end
  end

  head do
    url 'https://github.com/itchyny/aws3.git', branch: 'main'
    depends_on 'rust' => :build
  end

  def install
    if build.head?
      system 'cargo', 'install', *std_cargo_args
      generate_completions_from_executable(bin/'aws3', 'completion')
    else
      bin.install 'aws3'
      bash_completion.install 'completions/aws3.bash' => 'aws3'
      zsh_completion.install 'completions/_aws3'
      fish_completion.install 'completions/aws3.fish'
    end
  end

  test do
    system "#{bin}/aws3", '--version'
  end
end
