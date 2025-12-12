class Servox < Formula
  desc "Servo browser with WASM GC and TypeScript support"
  homepage "https://github.com/pannous/servo"
  license "MPL-2.0"
  version "2025.12.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pannous/servo/releases/download/v2025.12.13/servo-2025.12.13-darwin-arm64.tar.gz"
      sha256 "4f38c61a301d169d15a5e6ec8b29db9969ad650403b4fb546d3a435cf48bea06"
    end
  end

  def install
    bin.install "servo"
    # Install GStreamer libraries next to binary (rpath expects bin/lib/)
    if (buildpath/"lib").exist?
      (bin/"lib").install Dir["lib/*"]
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
