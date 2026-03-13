class LocalLlmStack < Formula
  desc "Run a local LLM stack with one command"
  homepage "https://github.com/0xCA5E/local-llm-stack"
  head "https://github.com/0xCA5E/local-llm-stack.git", branch: "main"
  url "https://github.com/0xCA5E/local-llm-stack/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "4053a7982c8d6c8e2169e5c439594ace40fdd0632d28d762b3e9a32b0be2a54e"
  license "MIT"

  depends_on :macos

  def install
    libexec.install "Start AI.command", "Stop AI.command", "Install Dependencies.command", "Clean AI.command", "Doctor AI.command"
    bin.install "bin/local-llm-install-deps", "bin/local-llm-start", "bin/local-llm-stop", "bin/local-llm-clean", "bin/local-llm-doctor", "bin/local-llm-status"
  end

  def caveats
    <<~EOS
      This formula is macOS-only and uses AppleScript (`osascript`) + Terminal.app automation.

      First-run Docker Desktop requirement:
        - Launch Docker Desktop once and complete onboarding/permissions prompts.
        - The stack start command waits for Docker daemon readiness, but cannot complete app setup prompts for you.

      Installed commands:
        - local-llm-install-deps
        - local-llm-start
        - local-llm-stop
        - local-llm-clean
        - local-llm-doctor
        - local-llm-status (same as local-llm-doctor)
    EOS
  end

  test do
    assert_predicate bin/"local-llm-install-deps", :exist?
    assert_predicate bin/"local-llm-start", :exist?
    assert_predicate bin/"local-llm-stop", :exist?
    assert_predicate bin/"local-llm-clean", :exist?
    assert_predicate bin/"local-llm-doctor", :exist?
    assert_predicate bin/"local-llm-status", :exist?
  end
end
