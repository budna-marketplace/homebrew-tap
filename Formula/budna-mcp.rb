class BudnaMcp < Formula
  desc "MCP tools for the Budna marketplace API"
  homepage "https://github.com/budna-marketplace/mcp"
  url "https://github.com/budna-marketplace/mcp.git",
      revision: "2a17e61dd52e2f76ad2ba7c008b7fcbcd74322a6"
  version "0.3.2"
  license "MIT"

  depends_on "rust" => :build

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/budna-mcp")
  end

  test do
    assert_equal "budna-mcp #{version}", shell_output("#{bin}/budna-mcp --version").strip
  end
end
