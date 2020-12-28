# FileShelter Docker - AUR - ARM

This repository contains a Dockerfile for running the
[AUR version](https://aur.archlinux.org/packages/fileshelter/)
of [FileShelter](https://github.com/epoupon/fileshelter).

This probably isn't the best way to run FileShelter if you can
avoid it, but I wanted to use FileShelter as part of my
docker-compose on my raspberry pi and compiling it completely
from source manually in the Dockerfile turned out to be a nightmare
so this seems like a decent alternative.

## Usage

To use this container, simply run:

```bash
git clone https://github.com/mtoohey31/fileshelter-docker-aur-arm
cd fileshelter-docker-aur-arm
docker build -t fileshelter-aur .
```

These commands will download this repository and build the image (which may take
a decent amount of time depending on your host).

Then, to run the image, use:

```bash
docker run -p 5091:5091 fileshelter-aur
```

If you want file uploads to persist, you will need to mount the database with a
`-v` flag, which I believe is located at `/var/fileshelter/fileshelter.db`, though
I could be wrong. Also, if you want to make configuration changes, you will need
to mount the Wt config file, which appears to be located at `/var/fileshelter/wt_config.xml`,
though again, I'm not completely certain as I have not needed to make any
modifications myself.
