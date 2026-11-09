class BudnaMcp < Formula
  desc "MCP tools for the Budna marketplace API"
  homepage "https://github.com/budna-marketplace/mcp"
  url "https://github.com/budna-marketplace/mcp.git",
      revision: "b8f85d491e51dec1c7b815d3ea3c31445aadea88"
  version "0.8.2"
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
