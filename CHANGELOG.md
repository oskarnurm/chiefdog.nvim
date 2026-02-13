# Changelog

## [2.7.0](https://github.com/oskarnurm/koda.nvim/compare/v2.6.0...v2.7.0) (2026-02-13)


### Features

* add `char` to palette and link it ([#77](https://github.com/oskarnurm/koda.nvim/issues/77)) ([1387d72](https://github.com/oskarnurm/koda.nvim/commit/1387d72494a43171024ee34fd224c6f34e03f6c3))
* add get_palette() API for accessing colors ([#61](https://github.com/oskarnurm/koda.nvim/issues/61)) ([54b41b1](https://github.com/oskarnurm/koda.nvim/commit/54b41b19a883911efa0ca12dca3b2fdb2bb49e6a))
* add group loading support for plugins loaded with mini.deps ([#86](https://github.com/oskarnurm/koda.nvim/issues/86)) ([92f5fbd](https://github.com/oskarnurm/koda.nvim/commit/92f5fbd0177e8a458b741ede2063e5200032b872))
* **api:** expose blend function for user configuration ([#64](https://github.com/oskarnurm/koda.nvim/issues/64)) ([a09b004](https://github.com/oskarnurm/koda.nvim/commit/a09b004b576667d3e0c938c0b1de52a287088fc5))
* **extra:** add kitty theme ([#80](https://github.com/oskarnurm/koda.nvim/issues/80)) ([27b0b65](https://github.com/oskarnurm/koda.nvim/commit/27b0b65456e47ad5991e08e35dc7fa34768d9ebc))
* **extras:** add fzf dark and light theme ([#74](https://github.com/oskarnurm/koda.nvim/issues/74)) ([22061f3](https://github.com/oskarnurm/koda.nvim/commit/22061f3fe91472addf9017dd4501fd903af5be7c))
* **extras:** add koda dark and light theme for Ghostty ([#69](https://github.com/oskarnurm/koda.nvim/issues/69)) ([cf23e9c](https://github.com/oskarnurm/koda.nvim/commit/cf23e9cc900ca5db4a807029188cda9d34d986cf))
* **extras:** add koda dark and light theme for wezterm ([#67](https://github.com/oskarnurm/koda.nvim/issues/67)) ([a1ec3a4](https://github.com/oskarnurm/koda.nvim/commit/a1ec3a42c40b1e5338593675832968374098c76d))
* **extras:** add lazygit light and dark theme ([#70](https://github.com/oskarnurm/koda.nvim/issues/70)) ([2b4e5f4](https://github.com/oskarnurm/koda.nvim/commit/2b4e5f470499e429f022e7204f9ed790729fc04a))
* **groups:** add fallback check for standalone mini plugins when using deps ([8c3b21b](https://github.com/oskarnurm/koda.nvim/commit/8c3b21b7de14009ef7be7445e3015be415cf4cf3))
* **lsp:** highlight semantic types more granularly ([#79](https://github.com/oskarnurm/koda.nvim/issues/79)) ([4656c35](https://github.com/oskarnurm/koda.nvim/commit/4656c35fa23b1c761ae534ecc959402571348676))
* **lsp:** link `type.modifier` and `namespace.attribute` to `Keyword` ([e665567](https://github.com/oskarnurm/koda.nvim/commit/e6655677661ca0f9692f5566d6a2930620660f6e))
* **treesitter:** link punctuation and brackets to `Normal` instead ([f2a48e4](https://github.com/oskarnurm/koda.nvim/commit/f2a48e4ef2d57a6ed015c1544fa28b8315d97530))
* update lifetime, module and types highlights to be more emphasized ([#75](https://github.com/oskarnurm/koda.nvim/issues/75)) ([5ac352d](https://github.com/oskarnurm/koda.nvim/commit/5ac352d208a7e99ac7cfd4de37774774925057c4))


### Bug Fixes

* change CursorColumn bg to use line color ([#82](https://github.com/oskarnurm/koda.nvim/issues/82)) ([c5cc9b1](https://github.com/oskarnurm/koda.nvim/commit/c5cc9b1cb4e56943a0e1b0d4e6e5463ae4ed8544))
* **extras:** change fzf prompt color ([5ec4ac3](https://github.com/oskarnurm/koda.nvim/commit/5ec4ac391a5d794c5a58f12881ba413fb49c8524))
* **extras:** fix wrong background hue in WezTerm ([5fdaa97](https://github.com/oskarnurm/koda.nvim/commit/5fdaa9791c891c4af0e7770903af75d7d2cc0329))
* **icons:** add missing palette colors for mini.icons ([25c52c7](https://github.com/oskarnurm/koda.nvim/commit/25c52c710a5083cf6f3ac533d57fefecce7e2021))
* **mini:** detect individual mini.* modules for group activation ([#83](https://github.com/oskarnurm/koda.nvim/issues/83)) ([cc592e1](https://github.com/oskarnurm/koda.nvim/commit/cc592e1ac66c4f12f8abb635d0f96fb81732d796))
* **palette:** fix `pink` and `cyan` being too bright on light mode ([7582718](https://github.com/oskarnurm/koda.nvim/commit/7582718aba62dacd064f5095d8d3c5bd604751cf))
* **syntax:** explicitly set `Macro` to `const` color ([be1e3d2](https://github.com/oskarnurm/koda.nvim/commit/be1e3d27650d2cf8bf00a04a2091378ed7c81572))

## [2.6.0](https://github.com/oskarnurm/koda.nvim/compare/v2.5.0...v2.6.0) (2026-01-31)


### Features

* add more semantic highlights ([#58](https://github.com/oskarnurm/koda.nvim/issues/58)) ([9b3d76a](https://github.com/oskarnurm/koda.nvim/commit/9b3d76ad9309562aa862bfce823a8e821d69078f))
* **base:** change directory color to `emphasis` ([a8948b6](https://github.com/oskarnurm/koda.nvim/commit/a8948b619acf5ad6c6b035c6f70e59f20347571f))
* **mini:** add color to mini.jump2d ([#59](https://github.com/oskarnurm/koda.nvim/issues/59)) ([f1c4e7f](https://github.com/oskarnurm/koda.nvim/commit/f1c4e7f8ca65048cd62dbd0443eb95f749576c80))
* **palette:** change hue on orange color a tiny bit ([41111cd](https://github.com/oskarnurm/koda.nvim/commit/41111cd0dfa6d6765d1a1a1024eaf1a9c0e05abb))
* **palette:** remove yellow color ([fae026c](https://github.com/oskarnurm/koda.nvim/commit/fae026c8b5e44991940537201b40b2028b6829d1))
* **plugins:** add `strikethrough` attribute to NeoTreeGitDeleted ([d55e616](https://github.com/oskarnurm/koda.nvim/commit/d55e616819a86c6ed2a3ff0066419bcc90f08391))
* **plugins:** add support for Neo-tree.nvim ([d7c6f51](https://github.com/oskarnurm/koda.nvim/commit/d7c6f512c00a265abd91e3f32ae0b8be781374a2))
* **plugins:** update mini.icon colors to match new palette ([d16f436](https://github.com/oskarnurm/koda.nvim/commit/d16f436991eee6aaaa96522e24a319cdf0f11746))

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
