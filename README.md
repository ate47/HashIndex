# Hash Index

[![Release](https://github.com/ate47/HashIndex/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/ate47/HashIndex/actions/workflows/release.yml)

Index containing different hashes, feel free to reuse them. 

The repository was created using hashes from various sources, see the credits section for the list.

## Downloads

| File | Description |
|------|-------------|
| [hashes-all.zip](https://github.com/ate47/HashIndex/releases/download/release/hashes-all.zip) | All the hashes |
| [hashes-xassets-all.zip](https://github.com/ate47/HashIndex/releases/download/release/hashes-xassets-all.zip) | All XAssets, useful for [Greyhound](https://github.com/Scobalula/Greyhound)|
| [hashes-scr-all.zip](https://github.com/ate47/HashIndex/releases/download/release/hashes-scr-all.zip) | All source hashes, to be used with a decompiler like [acts](https://github.com/ate47/atian-cod-tools) |

## Propose new hashes

[See CONTRIBUTING.md](.github/CONTRIBUTING.md).

## Dev

The different hashing algorithms are explained in [docs/hashes](docs/hashes.md).

The files are exported to .wni files. The file structure is in unaligned little endian:

It is composed of:

- file magic `0x20494E57` (32 bits integer)
- file version `1` (16 bits integer)
- number of entries (32 bits integer)
- compressed size of the data (32 bits integer)
- decompressed size of the data (32 bits integer)
- [LZ4](https://github.com/lz4/lz4) compressed data (compressed size of the data bytes)

The decompressed data is number of entries times this data structure:

- hashed value (64 bits unsigned integer)
- unhashed value (0 bit terminated string)


Depending on the origin of the hash, a 63 or 60 bits mask might have been applied. For an optimal usage, it is suggested to apply a 60 bits mask to each hash while loading or querying a dataset. i.e. `(hash & 0xFFFFFFFFFFFFFFF)`.

## Credits

This index is based on different repositories

- Scobalula : WNI format, the [GreyhoundPackageIndex](https://github.com/Scobalula/GreyhoundPackageIndex)
- Scobalula, serious, xensik : scr hashes inside their decompilers ([Cerberus](https://github.com/Scobalula/Cerberus-Repo), [T89-Dec](https://github.com/shiversoftdev/T89-Dec), [gsc-tool](https://github.com/xensik/gsc-tool/))
- jek47, Luisete2105 : scr hashes
- Richkiller, xCortlandx: xassets hashes
