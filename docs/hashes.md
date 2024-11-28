## Hashes algorithms

For a c++ implementation, the [hash.hpp](https://github.com/ate47/atian-cod-tools/blob/main/src/shared/utils/hash.hpp) header can be used.

It exists different hash algorithms used by Call of duty, this page is explaining them.

**Table of Contents**
- [Hashes algorithms](#hashes-algorithms)
  - [List and usages](#list-and-usages)
  - [FNV1A](#fnv1a)
  - [Black Ops 4/CW Scr hashes](#black-ops-4cw-scr-hashes)

### List and usages

Here is the list of all the algorithm and their usages.

- **Base FNV1A 63** : #"" operator in bo4, cw, mwiii gsc, name of the XAssets in bo4 and cws
- **Base FNV1A 64** : #"" operator in bo6 gsc, some XAssets values in bo6
- **IW Resources** : Name of the XAssets in the mwii/mwiii/bo6, r"" and %"" gsc operator in bo6,mwii,mwiii
- **MWII/III Scr** : Scr hash in mwii/mwiii, &"" gsc operator in mwii/mwiii
- **Black Ops 3 Scr** : All the hashes in mwiii gsc
- **hash_bo4cw_scr** : Scr hash in bo4/cw
- **Black Ops 6 Scr** : Scr hash in bo6, &"" gsc operator in bo6
- **Black Ops 6 SP Scr** : Scr hash in bo6 campaign, &"" gsc operator in bo6 campaign
- **IW Dvars** : Dvar hash in mwii/mwiii/bo6, @"" gsc operator in mwii/mwiii/bo6


### FNV1A

The [FNV](https://en.wikipedia.org/wiki/Fowler%E2%80%93Noll%E2%80%93Vo_hash_function) hash functions are a set of functions converting a string to a number called hash. In call of duty variation of the FNV1A function is used.

The base algorithm is

```python
def fnv1a(string : str, hash = FNV_OFFSET, iv = FNV_PRIME, mask = RESULT_MASK):
    for c in string:
        hash = hash ^ c
        hash = hash * iv

    return hash & mask

```

The function is then tuned using the FNV_OFFSET, FNV_PRIME and RESULT_MASK.

| name          | FNV_OFFSET           | FNV_PRIME       | RESULT_MASK          | Size |
| ------------- | -------------------- | --------------- | -------------------- | ---- |
| Base FNV1A 63 | `0xcbf29ce484222325` | `0x100000001b3` | `0x7FFFFFFFFFFFFFFF` | 63   |
| Base FNV1A 64 | `0xcbf29ce484222325` | `0x100000001b3` | `0xFFFFFFFFFFFFFFFF` | 64   |
| Base FNV1A 32 | `0x811C9DC5`         | `0x1000193`     | `0xFFFFFFFF`         | 32   |
| IW Resources  | `0x47F5817A5EF961BA` | `0x100000001b3` | `0x7FFFFFFFFFFFFFFF` | 63   |
| MWII/III Scr  | `0x79D6530B0BB9B5D1` | `0x10000000233` | `0x7FFFFFFFFFFFFFFF` | 63   |

It is then do some variations to the function, 


First in Black Ops 3, the last character `\0` is considered, multiplying another time the IV

```python
def fnv1a_bo3(string : str, hash = FNV_OFFSET, iv = FNV_PRIME, mask = RESULT_MASK):
    for c in string:
        hash = hash ^ c
        hash = hash * iv
    
    hash = hash * iv
    return hash & mask

```

| name            | FNV_OFFSET   | FNV_PRIME   | RESULT_MASK  | Size |
| --------------- | ------------ | ----------- | ------------ | ---- |
| Black Ops 3 Scr | `0x4B9ACE2F` | `0x1000193` | `0xFFFFFFFF` | 32   |

During MWII another type was introduced, the secure hashes. They introduce a particular string between the first character and the rest of the string.

```python
def fnv1a_sec(string : str, sec_string = SEC_STRING, hash = FNV_OFFSET, iv = FNV_PRIME, mask = RESULT_MASK):
    return fnv1a(string[0] + sec_string + string[1:], hash, iv, mask)

```

| name            | FNV_OFFSET           | FNV_PRIME       | SEC_STRING         | RESULT_MASK          | Size |
| --------------- | -------------------- | --------------- | ------------------ | -------------------- | ---- |
| IW Dvars        | `0xD86A3B09566EBAAC` | `0x10000000233` | `q6n-+7=tyytg94_*` | `0xFFFFFFFFFFFFFFFF` | 64   |
| Black Ops 6 Scr | `0x1C2F2E3C8A257D07` | `0x10000000233` | `zt@f3yp(d[kkd=_@` | `0xFFFFFFFFFFFFFFFF` | 64   |

During the Black Ops 6 development, another version of the secure string was used with the string being after string to hash. These hashes are only used in the campaign.

```python
def fnv1a_sec_suffix(string : str, sec_string = SEC_STRING, hash = FNV_OFFSET, iv = FNV_PRIME, mask = RESULT_MASK):
    return fnv1a(string + sec_string, hash, iv, mask)

```

| name               | FNV_OFFSET           | FNV_PRIME       | SEC_STRING         | RESULT_MASK          | Size |
| ------------------ | -------------------- | --------------- | ------------------ | -------------------- | ---- |
| Black Ops 6 SP Scr | `0x1C2F2E3C8A257D07` | `0x10000000233` | `zt@f3yp(d[kkd=_@` | `0xFFFFFFFFFFFFFFFF` | 64   |

### Black Ops 4/CW Scr hashes

In Black Ops 4 and CW, a 32 bits hash is used, I don't know its name, but the algorithm is:

```python
def hash_bo4cw_scr(string : str):
    hash = 0x4B9ACE2F;

    for (c in string):
        hash = ((c + hash) ^ ((c + hash) << 10)) + (((c + hash) ^ ((c + hash) << 10)) >> 6);

    return 0x8001 * ((9 * hash) ^ ((9 * hash) >> 11));
```

