class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.5"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.5/valdr-v0.3.5-macos-arm64.tar.gz"
    sha256 "f718470aa2b6c97d9f97c8ec5d8ae952cd7780211a061ba456fea4c4074f0e4d"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.5/valdr-v0.3.5-linux-arm64.tar.gz"
      sha256 "64d4ac59437aee339a26f83ffa2b729570925768e14d029d1fc96371ede7ba48"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.5/valdr-v0.3.5-linux-x64.tar.gz"
      sha256 "3543fe138800ea9005d865b109122c33d24fd1ff0b04b67370e25bfb32be8d62"
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
