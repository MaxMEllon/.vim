<div name="top" align="center">
  <img
    src="https://raw.githubusercontent.com/MaxMEllon/demos/master/vimrc.jpg"
    alt="logo images"
  />
</div>

<p align="center">
  <b><a href="#features">Features</a></b>
  |
  <b><a href="#installation">Installation</a></b>
  |
  <b><a href="#updating">Updating</a></b>
  |
  <b><a href="#uninstallation">UnInstallation</a></b>
  |
  <b><a href="#license">License</a></b>
</p>

Features
---

  - Vim (clpum)
  - NeoVim
  - MacVim-KaoriYa
  - gVim(KaoriYa)

<p align="right"><a href="#top">:arrow_heading_up:</a></p>

Installation
---

  - remote install
    - `curl https://raw.githubusercontent.com/MaxMEllon/.vim/master/installer | bash`

  - local install

    - `make install`

<p align="right"><a href="#top">:arrow_heading_up:</a></p>

Updating
---

  - `make update`

<p align="right"><a href="#top">:arrow_heading_up:</a></p>

UnInstallation
---

  - `make clean`

<p align="right"><a href="#top">:arrow_heading_up:</a></p>

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

- lint

```
$ vint --color --style `git ls-files | grep vim`
```

<p align="right"><a href="#top">:arrow_heading_up:</a></p>

LICENSE
---

[![maxmellon](https://avatars1.githubusercontent.com/u/9594376?v=3&u=8fd5ebc98054f4945469deef085ef244f3999206&s=80)](https://twitter.com/mozi_kke)

**Copyright (c) 2016 "MaxMEllon" Kento TSUJI**

Licensed under the [MIT license](./LICENSE.txt)


<p align="right"><a href="#top">:arrow_heading_up:</a></p>
