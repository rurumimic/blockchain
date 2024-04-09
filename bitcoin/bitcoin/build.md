# Build

- github: [bitcoin](https://github.com/bitcoin)
  - [bitcoin/bitcoin](https://github.com/bitcoin/bitcoin)
    - [bitcoin/doc/build-unix.md](https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md)
    - [bitcoin/doc/dependencies.md](https://github.com/bitcoin/bitcoin/blob/master/doc/dependencies.md)

## Clone

```bash
git clone https://github.com/bitcoin/bitcoin.git
cd bitcoin
```

### Dependencies

#### Ubuntu

```bash
sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
sudo apt-get install libevent-dev libboost-dev
sudo apt-get install qtbase5-dev qttools5-dev qttools5-dev-tools
sudo apt-get install qtwayland5
sudo apt-get install libqrencode-dev
```

### Autogen

```bash
./autogen.sh
```

### Configure

```bash
mkdir dist
```

```bash
export CC=clang
export CXX=clang++
```

```bash
./configure --prefix="${PWD}/dist"
./configure --prefix="${PWD}/dist" --with-gui=no
./configure --prefix="${PWD}/dist" --disable-wallet --with-gui=no
```

### Make

```bash
nproc

12
```

```bash
bear -- make -j13
```

### Install

```bash
make install
```

---

## Installed

```bash
bitcoin.git/dist
├── bin
│   ├── bench_bitcoin
│   ├── bitcoin-cli
│   ├── bitcoin-qt
│   ├── bitcoin-tx
│   ├── bitcoin-util
│   ├── bitcoin-wallet
│   ├── bitcoind
│   ├── test_bitcoin
│   └── test_bitcoin-qt
└── share
    └── man
        └── man1
            ├── bitcoin-cli.1
            ├── bitcoin-qt.1
            ├── bitcoin-tx.1
            ├── bitcoin-util.1
            ├── bitcoin-wallet.1
            └── bitcoind.1

4 directories, 15 files
```

