# Neovim Keymap Cheatsheet

Leader Key: `Space`

## Core Mappings
| Keybind | Description |
|---------|-------------|
| `jj` | Exit Insert Mode (alternative to Esc) |
| `j` / `k` | Move by screen lines (wrapped lines) |
| `<leader>nh` | Clear search highlights |
| `<leader>ch` | Open this cheatsheet |
| `<leader>+` / `-` | Increment / Decrement number |

## Window & Tab Management
| Keybind | Description |
|---------|-------------|
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>se` | Make splits equal size |
| `<leader>sx` | Close current split |
| `<leader>sm` | Maximize/minimize current split |
| `<leader>to` | Open new tab |
| `<leader>tx` | Close current tab |
| `<leader>tn` | Go to next tab |
| `<leader>tp` | Go to previous tab |
| `<leader>tf` | Move current buffer to new tab |

## Trouble (Modern Quickfix & Diagnostics)
| Keybind | Description |
|---------|-------------|
| `<leader>xx` | Toggle Diagnostics (Project) |
| `<leader>xX` | Toggle Diagnostics (Current Buffer) |
| `<leader>xq` | Toggle Quickfix List |
| `<leader>xl` | Toggle Location List |
| `<leader>cs` | Toggle LSP Symbols |

### Inside Trouble Window:
- `j` / `k`: Navigate through items
- `Enter`: Jump to location and close Trouble
- `o`: Jump to location but keep Trouble open
- `p`: Toggle preview window
- `q`: Close Trouble window
- `i`: Toggle details/inspection

## File Explorer (Neo-tree)
| Keybind | Description |
|---------|-------------|
| `\` | Toggle Neo-tree reveal |
| `q` | (Inside window) Close Neo-tree |

## Fuzzy Finder (Telescope)
| Keybind | Description |
|---------|-------------|
| `<leader>ff` | Find files in project |
| `<leader>fr` | Find recent files |
| `<leader>fs` | Find string in project (live grep) |
| `<leader>fc` | Find string under cursor |
| `<leader>ft` | Find todos |
| `Ctrl + q` | (Inside Telescope) Send results to Quickfix list |

## LSP (Language Server Protocol)
| Keybind | Description |
|---------|-------------|
| `gd` | Go to Definition |
| `gD` | Go to Declaration |
| `gi` | Go to Implementation |
| `gt` | Go to Type Definition |
| `gR` | Show References |
| `K` | Show documentation (Hover) |
| `<leader>ca` | See available Code Actions |
| `<leader>rn` | Smart Rename |
| `<leader>d` | Show line diagnostics |
| `<leader>D` | Show buffer diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>rs` | Restart LSP |

## Harpoon (Fast Navigation)
| Keybind | Description |
|---------|-------------|
| `<leader>ha` | Add file to Harpoon |
| `<C-e>` | Toggle Harpoon quick menu |
| `<leader>h1-4`| Jump to file 1-4 |
| `<leader>hn` | Go to next Harpoon file |
| `<leader>hp` | Go to previous Harpoon file |

## UndoTree (Version History)
| Keybind | Description |
|---------|-------------|
| `<leader>u` | Toggle UndoTree |

### Inside UndoTree Window:
- `j` / `k`: Move up/down the undo tree (diff updates automatically)
- `Enter`: Revert file to that specific state
- `P`: Toggle a larger Diff/Preview window
- `q`: Close UndoTree window
- `u` / `Ctrl + r`: Standard undo/redo also work inside the tree
