# AlliotTech's Homebrew Tap

Personal [Homebrew](https://brew.sh) tap for my macOS apps.

## Install

```bash
brew tap Alliottech/tap
brew install --cask <cask>
```

Or directly without an explicit `brew tap`:

```bash
brew install --cask Alliottech/tap/<cask>
```

> Recent Homebrew versions refuse to load casks from untrusted third-party taps.
> If you see `Refusing to load cask … from untrusted tap`, run:
>
> ```bash
> brew trust Alliottech/tap
> ```

## Available casks

| Cask | Version | Description | Arch | Source |
|---|---|---|---|---|
| `aitranslator` | 1.1 | AI translation for macOS with screenshot OCR and streaming output | Apple Silicon | [AlliotTech/AITranslator](https://github.com/AlliotTech/AITranslator) |
| `apaste` | 0.12.0 | SwiftUI-native paste manager | Universal (per-arch dmg) | [AlliotTech/aPaste](https://github.com/AlliotTech/aPaste) |
| `alt-tab-no-pro` | 11.7.1 | No-pro local build of [AltTab](https://github.com/lwouis/alt-tab-macos) | Universal | [AlliotTech/alt-tab-macos](https://github.com/AlliotTech/alt-tab-macos) |
| `uutmux` | 0.1.3 | Menu bar manager for NetEase UU remote terminal sessions | Universal (per-arch dmg) | [AlliotTech/uu-tmux](https://github.com/AlliotTech/uu-tmux) |

## Brewfile

```ruby
tap "Alliottech/tap"
cask "aitranslator"
cask "apaste"
cask "alt-tab-no-pro"
cask "uutmux"
```

## Updating

```bash
brew update          # refresh tap metadata
brew upgrade --cask  # upgrade all outdated casks from this tap
```

`apaste` and `uutmux` casks are bumped automatically by the
[`update-*` workflows](.github/workflows) whenever a new GitHub release is
published; the other casks are updated manually.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
