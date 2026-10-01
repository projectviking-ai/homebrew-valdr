class Valdr < Formula
  desc "Valdr CLI for project orchestration"
  homepage "https://github.com/projectviking-ai/valdr"
  version "0.3.4"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.4/valdr-v0.3.4-macos-arm64.tar.gz"
    sha256 "cf10f6c024e21b5c791114d00cf7c20b0e43248495f9c48ce1364963d2ff3ca7"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.4/valdr-v0.3.4-linux-arm64.tar.gz"
      sha256 "8bfd7cbc791abf100fac4f65bd1dd7cde7febbc84ec57bb891024002a0f27199"
    elsif Hardware::CPU.intel?
      url "https://github.com/projectviking-ai/valdr-releases/releases/download/v0.3.4/valdr-v0.3.4-linux-x64.tar.gz"
      sha256 "0461798f22da6786292d2ccb9bd215561c754ea231e218a134bd5628bf7ba3ca"
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
