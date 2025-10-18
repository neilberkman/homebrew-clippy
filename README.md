# Homebrew Tap for Clippy

## ⚠️ Important: Clippy is now in Homebrew Core!

**For clippy and pasty**, use the official Homebrew installation:

```bash
brew install clippy
```

This tap is now maintained **only for Draggy** (the optional GUI companion app).

## Draggy Installation

```bash
brew install --cask neilberkman/clippy/draggy
```

## Migration

If you previously installed clippy from this tap:

```bash
# Uninstall tap version
brew uninstall neilberkman/clippy/clippy

# Install from Homebrew Core
brew install clippy
```

You can keep the tap installed if you use Draggy. If not, you can remove it:

```bash
brew untap neilberkman/clippy
```
