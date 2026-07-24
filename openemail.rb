# typed: false
# frozen_string_literal: true

# Homebrew formula for the OpenEmail CLI.
# Normally generated + updated by GoReleaser on each tagged release; this v0.1.1
# copy was published by hand because the release run lacked a tap-writable token.
class Openemail < Formula
  desc "Command-line client for the OpenEmail platform"
  homepage "https://github.com/Open-Email/cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/Open-Email/cli/releases/download/v0.1.1/openemail_0.1.1_darwin_amd64.tar.gz"
      sha256 "2f1fc66845fac39a6ed5181de9f2fa95a64288abe44ac3b99f9af78a95c59205"
    end
    if Hardware::CPU.arm?
      url "https://github.com/Open-Email/cli/releases/download/v0.1.1/openemail_0.1.1_darwin_arm64.tar.gz"
      sha256 "046969274b56285dc3f73f70e2c4af5fc899958e44c77c26443a135cb0ebab52"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Open-Email/cli/releases/download/v0.1.1/openemail_0.1.1_linux_amd64.tar.gz"
      sha256 "54c9304fd5bf79b34a618fc95532ef755ebe71bf8dddcd1dd7c83b440f4c89e2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/Open-Email/cli/releases/download/v0.1.1/openemail_0.1.1_linux_arm64.tar.gz"
      sha256 "8c668ad649a2e4e9271af4bd6819829a82cbc5626ee2dca7f1b4637a146772c9"
    end
  end

  def install
    bin.install "openemail"
    bash_completion.install "completions/openemail.bash" => "openemail"
    zsh_completion.install "completions/openemail.zsh" => "_openemail"
    fish_completion.install "completions/openemail.fish"
  end

  test do
    system "#{bin}/openemail", "version"
  end
end
