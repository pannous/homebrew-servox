class Servox < Formula
  desc "Servox browser with WASM GC and TypeScript support"
  homepage "https://github.com/pannous/servox"
  license "MPL-2.0"
  version "2025.12.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pannous/servo/releases/download/v2025.12.13/servo-2025.12.13-darwin-arm64.tar.gz"
      sha256 "4f38c61a301d169d15a5e6ec8b29db9969ad650403b4fb546d3a435cf48bea06"
    end
  end

  def install
    bin.install "servox"
  end

  def caveats
    <<~EOS
      🎉 Servox with WASM GC and TypeScript support!

      Features:
        • <script type="text/wast"> - WebAssembly Text format
        • <script type="text/typescript"> - TypeScript support
        • WASM GC structs with named field access
        • Direct property access: box.val, box[0]

      Quick test:
        curl -O https://raw.githubusercontent.com/pannous/servox/main/test-all.html
        servox test-all.html

      Links:
        Source: https://github.com/pannous/servox
        Tests:  https://github.com/pannous/servox/tree/main/test-*.html
    EOS
  end

  test do
    system "#{bin}/servox", "--version"
  end
end
