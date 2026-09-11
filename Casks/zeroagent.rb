cask "zeroagent" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "2d72c57c7b5abf04e25817761c9c634b1ee3fec4e8e836a002c5d74c935c67fb",
         intel: "6275061e59b2b35e3c8da523b69220839e4125c81b483f24b26cbba3698e8ed7"

  url "https://releases.zeroagenthq.com/ZeroAgent-#{version}-#{arch}.dmg"
  name "ZeroAgent"
  desc "Desktop workspace where a lead agent dispatches work to worker agents"
  homepage "https://zeroagenthq.com"

  livecheck do
    url "https://releases.zeroagenthq.com/latest-mac.yml"
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
