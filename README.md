# Hash Index

[![Release](https://github.com/ate47/HashIndex/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/ate47/HashIndex/actions/workflows/release.yml)

Index containing different hashes, feel free to reuse them.

The repository was created using hashes from various sources, see the credits section for the list.

![meme](docs/logo.png)

## Downloads

The hash index is available as compiled ACEF, CDB or WNI file formats, a release is available for each format.

- [WNI Hash index files](https://github.com/ate47/HashIndex/releases/tag/release) (usab)
- [ACEF Hash index files](https://github.com/ate47/HashIndex/releases/tag/release-acef)
- [CDB Hash index files](https://github.com/ate47/HashIndex/releases/tag/release-cdb)

## Usage

The hash files can be used with different utilities.

| Utility                                                             | Formats              | Description                |
| ------------------------------------------------------------------- | -------------------- | -------------------------- |
| [Atian Tools](https://github.com/ate47/atian-cod-tools)                    | `acef`, `wni`, `cdb` | COD Utilities              |
| [Greyhound](https://github.com/Scobalula/Greyhound)                 | `wni`                | COD Graphic XAsset utility |
| [Saluki](https://github.com/echo000/saluki-releases)                | `cdb`                | COD Graphic XAsset utility |
| [CoDLuaDecompiler](https://github.com/JariKCoding/CoDLuaDecompiler) | `wni`                | Lua scripts decompiler     |

## Propose new hashes

[See CONTRIBUTING.md](.github/CONTRIBUTING.md).

## Dev

- [docs/cdb](docs/cdb.md) : Explanation of the cdb file format.
- [docs/hashes](docs/hashes.md) : Explanation of the different hash algorithms.
- [docs/wni](docs/wni.md) : Explanation of the wni file format.

## Credits

This index is based on different repositories

- Scobalula : WNI format, the [GreyhoundPackageIndex](https://github.com/Scobalula/GreyhoundPackageIndex)
- Scobalula, serious, xensik : scr hashes inside their decompilers ([Cerberus](https://github.com/Scobalula/Cerberus-Repo), [T89-Dec](https://github.com/shiversoftdev/T89-Dec), [gsc-tool](https://github.com/xensik/gsc-tool/))
- jek47, Luisete2105 : scr hashes
- Richkiller, xCortlandx: xassets hashes
- dtzxporter : CDB format
