class Servox < Formula
  desc "Servox browser with WASM GC and TypeScript support"
  homepage "https://github.com/pannous/servox"
  license "MPL-2.0"
  version "2025.12.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/pannous/servox/releases/download/v2025.12.15/servox-2025.12.15-darwin-arm64.tar.gz"
      sha256 "ab225bb222ceb4f1f5f1cdcdb8439eba0ae9ea786fac50aa20bf909793752ce3"
    end
  end

  def install
    bin.install "servox"
    (share/"servox").install "resources" if File.exist?("resources")
    (bin/"lib").install Dir["lib/*"] if File.exist?("lib")
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
        servox https://raw.githack.com/pannous/servox/main/test-all.html

      Links:
        Live Demo: https://raw.githack.com/pannous/servox/main/test-all.html
        Source: https://github.com/pannous/servox
        Tests:  https://github.com/pannous/servox/tree/main/test-*.html
    EOS
  end

  test do
    system "#{bin}/servo", "--version"
  end
end
