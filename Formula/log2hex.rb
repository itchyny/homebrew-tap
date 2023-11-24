class Log2hex < Formula
  homepage 'https://github.com/itchyny/log2hex'
  version '0.1.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/log2hex/releases/download/v0.1.1/log2hex_v0.1.1_darwin_arm64.zip'
      sha256 'c905d887ab973c0131cf235c5de11e0cb1c1def288849392a85072513f583678'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/log2hex/releases/download/v0.1.1/log2hex_v0.1.1_darwin_amd64.zip'
      sha256 '4429a0d53ea059a3a20463f0190597ec457df3be6d511424c346ba88d1e40d58'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/log2hex/releases/download/v0.1.1/log2hex_v0.1.1_linux_arm64.zip'
      sha256 '5a67cdc8420888f9383f702a5d6428489a0ad288cd7b0966ea54d1c3dc248eb6'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/log2hex/releases/download/v0.1.1/log2hex_v0.1.1_linux_amd64.zip'
      sha256 '9fe37863ac56ea9761b7ce3ecec7effe5337108325c259583b044578a664558e'
    end
  end

  head do
    url 'https://github.com/itchyny/log2hex.git'
    depends_on 'rust' => :build
  end

  def install
    if build.head?
      system 'cargo', 'install', '--root', prefix, '--path', '.'
    else
      bin.install 'log2hex'
    end
    zsh_completion.install "_log2hex"
  end

  test do
    system "#{bin}/log2hex"
  end
end
