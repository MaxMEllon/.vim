Installation
---

  - remote install
    - `curl https://raw.githubusercontent.com/MaxMEllon/.vim/master/installer | bash`

  - local install

    - `make install`

Updating
---

  - `make update`

UnInstallation
---

  - `make clean`

Tips
---

- count up rc files.

```bash
$ git ls-files | grep vim | wc -l
```

- count up LOC

```bash
$ wc -l `git ls-files | grep vim` | tail -n 1
```

LICENSE
---

**Copyright (c) 2016 "MaxMEllon" Kento TSUJI**

Licensed under the [MIT license](./LICENSE.txt)
