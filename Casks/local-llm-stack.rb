cask "local-llm-stack" do
  version :latest
  sha256 "4f3c7c425ea6f204fe6cee9cd72df1ebf0e7f12d956f2ea6d86632830d29f210"

  url "https://github.com/0xCA5E/local-llm-stack/archive/refs/tags/v0.0.3.tar.gz",
      verified: "github.com/0xCA5E/local-llm-stack/"
  name "local-llm-stack"
  desc "Run a local LLM stack with one command"
  homepage "https://github.com/0xCA5E/local-llm-stack"

  depends_on cask: "docker"
  depends_on formula: "ollama"

  binary "local-llm-stack-main/bin/local-llm-start"
  binary "local-llm-stack-main/bin/local-llm-stop"
  binary "local-llm-stack-main/bin/local-llm-doctor"

  uninstall script: {
    executable:   "#{staged_path}/support/local-llm-uninstall-helper",
    sudo:         false,
    sudo_as_root: false,
  }

  zap trash: [
    "~/.local/state/local-llm",
    "/tmp/local_llm_terminal_window_ids.tmp",
    "/tmp/terminal_window_ids.tmp",
  ]
end