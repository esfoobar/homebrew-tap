# homebrew-tap

A Homebrew tap for MVPLean apps. Currently one cask: ZeroAgent.

## Install

```
brew install --cask zeroagentdev/tap/zeroagent
```

`brew upgrade` picks up new releases on its own; ZeroAgent also updates
itself in the background, so a Homebrew upgrade and the app's own updater
should never disagree about the current version for long.

## Uninstall

```
brew uninstall --cask zeroagent
```

Add `--zap` to also remove the app's saved settings and workspace state
under `~/Library/Application Support/ZeroAgent`, its caches, preferences,
logs and saved window state. This never touches a projects folder ZeroAgent
was pointed at; that is the user's own workspace, not the app's to remove.

## Maintenance

The cask (`Casks/zeroagent.rb`) is bumped automatically by the release
workflow in `esfoobar/zeroagent` when a new version ships. See that repo's
`docs/DOWNLOADS.md` for the manual bump procedure and the deploy key this
tap trusts for write access.
