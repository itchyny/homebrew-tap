class MackerelPluginDice < Formula
  homepage 'https://github.com/itchyny/mackerel-plugin-dice'
  version '0.1.1'

  if OS.mac?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-dice/releases/download/v0.1.1/mackerel-plugin-dice_v0.1.1_darwin_arm64.zip'
      sha256 '34dbc2c6a9ae9b1c6fa9b86f3758ac06dcf082cbd0aee9e67881e2dcb38d14b2'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-dice/releases/download/v0.1.1/mackerel-plugin-dice_v0.1.1_darwin_amd64.zip'
      sha256 '4ecb7b6fdd73155d8ed8503d16a057b8d6e7a27466f6a68110ae77030791d0ad'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url 'https://github.com/itchyny/mackerel-plugin-dice/releases/download/v0.1.1/mackerel-plugin-dice_v0.1.1_linux_arm64.zip'
      sha256 '44828995e59776f4a9f19c0f87e74bc11e17ba7450780a18e46c18e73a968922'
    elsif Hardware::CPU.intel?
      url 'https://github.com/itchyny/mackerel-plugin-dice/releases/download/v0.1.1/mackerel-plugin-dice_v0.1.1_linux_amd64.zip'
      sha256 'ce254ff456ec389ed235d361fc601fd3cc5fefd8a435b46c1656f7349cebd701'
    end
  end

  head do
    url 'https://github.com/itchyny/mackerel-plugin-dice.git'
    depends_on 'rust' => :build
  end

  def install
    if build.head?
      system 'cargo', 'install', '--root', prefix, '--path', '.'
    else
      bin.install 'mackerel-plugin-dice'
    end
  end

  test do
    system "#{bin}/mackerel-plugin-dice"
  end
end
