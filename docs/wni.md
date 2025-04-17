## WNI file format

The wni file format is a common format to share hashes, its file structure is in unaligned little endian:

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
