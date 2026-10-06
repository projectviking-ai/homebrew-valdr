class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.7"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.7/valdr-v0.3.7-macos-arm64.tar.gz"
    sha256 "37ab9488cdc27fc4090db0cf0125661c3dffe206672691c13a6f0a5bf3ed5d56"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.7/valdr-v0.3.7-linux-arm64.tar.gz"
      sha256 "6b81327b08e739ee4463c8be0a10b1a0b08f60596bae328c8a6557917a8d1073"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.7/valdr-v0.3.7-linux-x64.tar.gz"
      sha256 "a3b2ffadfd27019c711ee269f67a57ff19d4ff0fdc7c1c2750632f47cb0c5ceb"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install libexec/"bin/valdr"
  end

  test do
    assert_match "valdr ", shell_output("#{bin}/valdr version")
  end
end
