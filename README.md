# Hash Index

[![Release](https://github.com/ate47/HashIndex/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/ate47/HashIndex/actions/workflows/release.yml)

Index containing different hashes, feel free to reuse them. 

The repository was created using hashes from various sources, see the credits section for the list.

## Downloads

The hash index is available as compiled ACEF or WNI file formats.

| Format | File | Description |
|------|------|-------------|
| `WNI`  | [hashes-all.zip](https://github.com/ate47/HashIndex/releases/download/release/hashes-all.zip) | All the hashes |
| `ACEF` | [hashes-all.zip](https://github.com/ate47/HashIndex/releases/download/release-acef/hashes-all.zip) | All the hashes |
| `WNI`  | [hashes-xassets-all.zip](https://github.com/ate47/HashIndex/releases/download/release/hashes-xassets-all.zip) | All XAssets, useful for [Greyhound](https://github.com/Scobalula/Greyhound)|
| `ACEF` | [hashes-xassets-all.zip](https://github.com/ate47/HashIndex/releases/download/release-acef/hashes-xassets-all.zip) | All XAssets  |
| `WNI`  | [hashes-scr-all.zip](https://github.com/ate47/HashIndex/releases/download/release/hashes-scr-all.zip) | All script hashes, to be used with a decompiler like [acts](https://github.com/ate47/atian-cod-tools) |
| `ACEF` | [hashes-scr-all.zip](https://github.com/ate47/HashIndex/releases/download/release-acef/hashes-scr-all.zip) | All script hashes, to be used with a decompiler like [acts](https://github.com/ate47/atian-cod-tools) |
| `WNI`  | [hashes-lua-all.zip](https://github.com/ate47/HashIndex/releases/download/release/hashes-lua-all.zip) | Lua script names, to be used with a lua dumper/decompiler |
| `ACEF` | [hashes-lua-all.zip](https://github.com/ate47/HashIndex/releases/download/release-acef/hashes-lua-all.zip) | Lua script names, to be used with a lua dumper/decompiler |
| `WNI`  | [hashes-global-all.zip](https://github.com/ate47/HashIndex/releases/download/release/hashes-global-all.zip) | All hashes in a game, to be used with a fastfile unlinker like [acts](https://github.com/ate47/atian-cod-tools) |
| `ACEF` | [hashes-global-all.zip](https://github.com/ate47/HashIndex/releases/download/release-acef/hashes-global-all.zip) | All hashes in a game, to be used with a fastfile unlinker like [acts](https://github.com/ate47/atian-cod-tools) |

For a specific file, the release section is available for each format.

- [WNI Hash index files](https://github.com/ate47/HashIndex/releases/tag/release)
- [ACEF Hash index files](https://github.com/ate47/HashIndex/releases/tag/release-acef)

## Propose new hashes

[See CONTRIBUTING.md](.github/CONTRIBUTING.md).

## Dev

- [docs/hashes](docs/hashes.md) : Explanation of the different hash algorithms.
- [docs/wni](docs/wni.md) : Explanation of the wni file format.

## Credits

This index is based on different repositories

- Scobalula : WNI format, the [GreyhoundPackageIndex](https://github.com/Scobalula/GreyhoundPackageIndex)
- Scobalula, serious, xensik : scr hashes inside their decompilers ([Cerberus](https://github.com/Scobalula/Cerberus-Repo), [T89-Dec](https://github.com/shiversoftdev/T89-Dec), [gsc-tool](https://github.com/xensik/gsc-tool/))
- jek47, Luisete2105 : scr hashes
- Richkiller, xCortlandx: xassets hashes
