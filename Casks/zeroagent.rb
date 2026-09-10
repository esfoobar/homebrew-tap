cask "zeroagent" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "8bc2c4cdcc751204a2c959e4917cf9d42d2820eaa97e83ff78811030ce5dc505",
         intel: "9978ee6e19b9635df4c0ad8f56131a9bbdf95d6795d25b8d27a30dec21e3482f"

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
