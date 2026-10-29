class BudnaMcp < Formula
  desc "MCP tools for the Budna marketplace API"
  homepage "https://github.com/budna-marketplace/mcp"
  url "https://github.com/budna-marketplace/mcp.git",
      revision: "08545a648d05f6930974634b95d58e7a2143c4f2"
  version "0.4.1"
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
