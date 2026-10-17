class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.4.0"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.0/valdr-v0.4.0-macos-arm64.tar.gz"
    sha256 "4e834a203ac1e8a8d755d32f79735b9e5fc1eee5d0fba293b3d014af87656181"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.0/valdr-v0.4.0-linux-arm64.tar.gz"
      sha256 "e9b478fae292e77ada64e6bbc74c9c3987e3964e8ef8fd96b8577ccf84566ba2"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.4.0/valdr-v0.4.0-linux-x64.tar.gz"
      sha256 "b9372c8db11d8ce5c118c07a234a092b2d407cb8a0854203c77cf4e59dfa89f3"
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
