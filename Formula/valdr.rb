class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.10"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.10/valdr-v0.3.10-macos-arm64.tar.gz"
    sha256 "9f73444c64ebd1533b20c64f5fa67ef0dc11bd5e087be6ad80864da58a64354c"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.10/valdr-v0.3.10-linux-arm64.tar.gz"
      sha256 "de5d89acba5d6779477cb5fee288661bbdf5e578d8c4151f421ce092b3f30bb9"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.10/valdr-v0.3.10-linux-x64.tar.gz"
      sha256 "004f47f9f270845024410ee7ac989f71e567f596014cfc2017da51110e9cebf5"
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
