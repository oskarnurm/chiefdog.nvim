# Changelog

## [2.5.0](https://github.com/oskarnurm/koda.nvim/compare/v2.4.2...v2.5.0) (2026-01-23)


### Features

* enable plugin detection by default ([#53](https://github.com/oskarnurm/koda.nvim/issues/53)) ([966df52](https://github.com/oskarnurm/koda.nvim/commit/966df525e4580ce843eea3923b44d4f12cf884a6))


### Bug Fixes

* **hl:** link `typemod.class.declaration` to `Function` hl-group ([43c6e99](https://github.com/oskarnurm/koda.nvim/commit/43c6e999c9fe1dc4fb4cb00bebd7de97c40acda5))

## [2.4.2](https://github.com/oskarnurm/koda.nvim/compare/v2.4.1...v2.4.2) (2026-01-21)


### Bug Fixes

* **base:** update CurSearch and Substitute hl-group colors ([2731f09](https://github.com/oskarnurm/koda.nvim/commit/2731f09df8ee6e4006f7bec15ffd1b20a6b7f378))

## [2.4.1](https://github.com/oskarnurm/koda.nvim/compare/v2.4.0...v2.4.1) (2026-01-20)


### Bug Fixes

* **base:** update visual selection colors ([#49](https://github.com/oskarnurm/koda.nvim/issues/49)) ([8a3b879](https://github.com/oskarnurm/koda.nvim/commit/8a3b879c528d3b78e90ebe6b4502a2ea7fb0c768))
* **types:** add missing annotations for new colors in the palette ([#51](https://github.com/oskarnurm/koda.nvim/issues/51)) ([52e6220](https://github.com/oskarnurm/koda.nvim/commit/52e6220a8c2a5913bf5db3444f1ec8bcbd908530))

## [2.4.0](https://github.com/oskarnurm/koda.nvim/compare/v2.3.0...v2.4.0) (2026-01-20)


### Features

* add more plugin highlights ([#45](https://github.com/oskarnurm/koda.nvim/issues/45)) ([a14e4aa](https://github.com/oskarnurm/koda.nvim/commit/a14e4aaf0194a24a02d9b5d6f706fd82e01fbf58))
* add on_highlights function ([#44](https://github.com/oskarnurm/koda.nvim/issues/44)) ([2061818](https://github.com/oskarnurm/koda.nvim/commit/206181829e9c4bbc5cea2e591eb114c75b613c54))
* add tests ([#38](https://github.com/oskarnurm/koda.nvim/issues/38)) ([bd495cf](https://github.com/oskarnurm/koda.nvim/commit/bd495cfa9d47584b1bf28a1a9f9014978279343e))
* **palette:** make highlight color lighter shade on light bg ([9874a9d](https://github.com/oskarnurm/koda.nvim/commit/9874a9dcd165910ecff38f38c057724814a3aa9f))
* **palette:** update dim color for better render-markdown code block ([d6cccb9](https://github.com/oskarnurm/koda.nvim/commit/d6cccb9c5bc0d6865b4160b56453e1c3100b63f2))
* **utils:** add vim.notify to reload method ([a919742](https://github.com/oskarnurm/koda.nvim/commit/a919742aceb98a4727438215a7593b69ead46b9e))


### Bug Fixes

* backdrop and backgrounds on certain plugins ([#47](https://github.com/oskarnurm/koda.nvim/issues/47)) ([f38d970](https://github.com/oskarnurm/koda.nvim/commit/f38d9701cd5d431e8ebe15313ce93046de029d86))
* guard vim.pack access on Neovim stable ([71a4080](https://github.com/oskarnurm/koda.nvim/commit/71a4080d18935b6e6d628874985f26da184ac382))
* guard vim.pack access to prevent crash on Neovim stable ([e737817](https://github.com/oskarnurm/koda.nvim/commit/e737817adaeb4045f8712d6f1720066b402f28f7))
* see if release gh action will work now ([5515d20](https://github.com/oskarnurm/koda.nvim/commit/5515d201b8706be701bf6d64d02915f09014787d))
* set `opts.auto=false` by default ([a95ec61](https://github.com/oskarnurm/koda.nvim/commit/a95ec61d262762ab87a65aa7726db55f8b5253b5))

## [2.3.0](https://github.com/oskarnurm/koda.nvim/compare/v2.2.0...v2.3.0) (2026-01-17)


### Features

* add types.lua and fix annotations ([#27](https://github.com/oskarnurm/koda.nvim/issues/27)) ([3a0e43c](https://github.com/oskarnurm/koda.nvim/commit/3a0e43c1cb616d75f184d19d2ddab2f59d628acb))
* optimize requiring hl groups for plugins ([#22](https://github.com/oskarnurm/koda.nvim/issues/22)) ([b00e02e](https://github.com/oskarnurm/koda.nvim/commit/b00e02e9282a653662fd8519d66df80cf1db9fd8))
* **plugins:** add support for trouble.nvim ([b21e91e](https://github.com/oskarnurm/koda.nvim/commit/b21e91effca3b6238a6ee970699ee93c04f5e602))
* simplify setting automatic plugin installation ([#25](https://github.com/oskarnurm/koda.nvim/issues/25)) ([9e4414d](https://github.com/oskarnurm/koda.nvim/commit/9e4414dee2ffb2b8daea40921a51d4bd11155d16)), closes [#24](https://github.com/oskarnurm/koda.nvim/issues/24)

## [2.3.0](https://github.com/oskarnurm/koda.nvim/compare/v2.2.0...v2.3.0) (2026-01-17)


### Features

* add types.lua and fix annotations ([#27](https://github.com/oskarnurm/koda.nvim/issues/27)) ([3a0e43c](https://github.com/oskarnurm/koda.nvim/commit/3a0e43c1cb616d75f184d19d2ddab2f59d628acb))
* optimize requiring hl groups for plugins ([#22](https://github.com/oskarnurm/koda.nvim/issues/22)) ([b00e02e](https://github.com/oskarnurm/koda.nvim/commit/b00e02e9282a653662fd8519d66df80cf1db9fd8))
* **plugins:** add support for trouble.nvim ([b21e91e](https://github.com/oskarnurm/koda.nvim/commit/b21e91effca3b6238a6ee970699ee93c04f5e602))
* simplify setting automatic plugin installation ([#25](https://github.com/oskarnurm/koda.nvim/issues/25)) ([9e4414d](https://github.com/oskarnurm/koda.nvim/commit/9e4414dee2ffb2b8daea40921a51d4bd11155d16)), closes [#24](https://github.com/oskarnurm/koda.nvim/issues/24)
