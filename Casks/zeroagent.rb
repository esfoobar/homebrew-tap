cask "zeroagent" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "ffb9b755f54d8eadb1af62c1fac4e414911f06e2d59aaec7c83f91208467b9d0",
         intel: "27a9f19a20107197b12bc94f5863f052fa1c318ae9bc88380bf296833dbf8efd"

  url "https://releases.zeroagent.mvplean.com/ZeroAgent-#{version}-#{arch}.dmg"
  name "ZeroAgent"
  desc "Desktop workspace where a lead agent dispatches work to worker agents"
  homepage "https://mvplean.com/zeroagent"

  livecheck do
    url "https://releases.zeroagent.mvplean.com/latest-mac.yml"
    regex(/^version:\s*([\d.]+)/i)
  end

  # The app checks the same release feed on its own and updates itself
  # (ZA-148), so brew should never try to manage that part.
  auto_updates true
  depends_on macos: :ventura

  app "ZeroAgent.app"

  zap trash: [
    "~/Library/Application Support/ZeroAgent",
    "~/Library/Caches/com.mvplean.zeroagent",
    "~/Library/Logs/ZeroAgent",
    "~/Library/Preferences/com.mvplean.zeroagent.plist",
    "~/Library/Saved Application State/com.mvplean.zeroagent.savedState",
  ]
end
