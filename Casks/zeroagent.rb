cask "zeroagent" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "9e3c84b86be066bf9e481e370316381c62695009bd82a85868e034a238b86413",
         intel: "cfb0c5a2c293294487d77533515232af327382f25d7cc8c960b95d201aa0af29"

  url "https://releases.zeroagent.mvplean.com/ZeroAgent-#{version}-#{arch}.dmg"
  name "ZeroAgent"
  desc "Desktop workspace where a lead agent dispatches work to worker agents"
  homepage "https://mvplean.com/zeroagent/"

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
