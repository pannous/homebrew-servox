class Servo < Formula
  desc "Servo browser engine with WASM GC and TypeScript support"
  homepage "https://github.com/pannous/servo"
  license "MPL-2.0"
  version "2025.12.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pannous/servo/releases/download/v2025.12.12/servo-2025.12.12-darwin-arm64.tar.gz"
      sha256 "ea6817ebdce956f06ba50b7ab397550e875300eccb3d118b8053f99fef2dbe21"
    end
  end

  def install
    bin.install "servo"
  end

  def caveats
    <<~EOS
      🎉 Servo with WASM GC and TypeScript support!

      Features:
        • <script type="text/wast"> - WebAssembly Text format
        • <script type="text/typescript"> - TypeScript support
        • WASM GC structs with named field access
        • Direct property access: box.val, box[0]

      Quick test:
        curl -O https://raw.githubusercontent.com/pannous/servo/main/test-all.html
        servo test-all.html

      Links:
        Source: https://github.com/pannous/servo
        Tests:  https://github.com/pannous/servo/tree/main/test-*.html
    EOS
  end

  test do
    system "#{bin}/servo", "--version"
  end
end
