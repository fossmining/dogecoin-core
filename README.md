# Dogecoin Umbrel App Store

Community app store for umbrelOS with one app: **Dogecoin Core 1.14.9** (`doge-dogecoin-core`).

## What the app does

- `fetch` (one-shot) downloads the official `dogecoin-1.14.9-<arch>-linux-gnu.tar.gz`
  from github.com/dogecoin/dogecoin and installs it only if the SHA-256 matches the
  value pinned from the PGP-signed `SHA256SUMS.asc`. Supports `x86_64` and `aarch64`.
- `dogecoind` runs the official binary from `data/bin`, with chain data in `data/dogecoin`.
- `web` serves a status dashboard (sync, peers, mempool, RPC/ZMQ connection details)
  on the Umbrel app port **22580**, plus two home-screen widgets.

| | |
|---|---|
| P2P (published on the host) | `22556/tcp` |
| RPC (Umbrel Docker network only) | `doge-dogecoin-core_dogecoind_1:22555` |
| ZMQ | `28332` hashblock, `28333` rawblock, `28334` rawtx |
| RPC user / password | `umbrel` / derived per install, shown in the dashboard |

All containers use `python:3.12.11-slim-bookworm` pinned by multi-arch digest, so no
third-party Dogecoin image is trusted.

## Install

**Via this community store:** push this folder to a public Git repo, then in umbrelOS open
App Store → ⋯ → Community App Stores, paste the repo URL, and install *Dogecoin Core*.

**Sideload over SSH** (no Git hosting needed):

```sh
# from this folder on your computer
scp -r doge-dogecoin-core umbrel@umbrel.local:/tmp/
ssh umbrel@umbrel.local
STORE=$(ls -d ~/umbrel/app-stores/getumbrel-umbrel-apps-github-* | head -1)
rsync -a --delete --exclude=.gitkeep /tmp/doge-dogecoin-core/ "$STORE/doge-dogecoin-core/"
sudo umbreld client apps.install.mutate --appId doge-dogecoin-core
sudo umbreld client apps.state.query --appId doge-dogecoin-core
```

A sideloaded copy in the official store folder may disappear when Umbrel refreshes that
store; the installed app keeps running, but use the community store route for updates.
