class Servo < Formula
  desc "Servo browser engine with WASM GC and TypeScript support"
  homepage "https://github.com/pannous/servo"
  license "MPL-2.0"
  version "2025.12.12b"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pannous/servo/releases/download/v2025.12.12b/servo-2025.12.12b-darwin-arm64.tar.gz"
      sha256 "67c385c662bcf54ec571065f92693c7968cf5fd07b5ead7a16e0eb6935fc5e4d"
    end
  end

  def install
    bin.install "servo"
    # Install GStreamer libraries
    if (buildpath/"lib").exist?
      lib.install Dir["lib/*"]
    end
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
