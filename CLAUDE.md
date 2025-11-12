# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Neovim configuration built on the lazy.nvim plugin manager. The configuration follows a modular structure with each plugin defined in its own file under `lua/plugins/`.

## Key Architecture

### Plugin Management
- **lazy.nvim**: All plugins are managed through lazy.nvim with lazy loading
- **Configuration Pattern**: Each plugin is defined in `lua/plugins/` with its own configuration file
- **Bootstrap**: `lua/config/lazy.lua` handles automatic installation and setup of lazy.nvim
- **Plugin Loading**: Plugins are imported via `{ import = "plugins" }` in the lazy setup

### Core Configuration Structure
- **init.lua**: Main entry point containing global vim settings, keymaps, and basic configuration
- **lua/config/**: Core configuration files (lazy.nvim setup)
- **lua/plugins/**: Individual plugin configurations, each file returns a plugin spec

### LSP Integration
- **Language Servers**: Uses mason.nvim for automatic LSP installation
- **Configured LSPs**: lua_ls, eslint, fixjson, typescript-tools
- **LSP Keymaps**: Defined in `lua/plugins/lsp-config.lua:77-113` with telescope integration
- **Capabilities**: Enhanced with nvim-cmp completion capabilities

### Completion System
- **nvim-cmp**: Primary completion engine with multiple sources
- **Sources**: LSP, LuaSnip, buffer, path, cmdline, lazydev
- **Snippet Engine**: LuaSnip with friendly-snippets integration
- **Keymaps**: Arrow keys for navigation, CR for confirm, Tab for snippets

### File Navigation
- **Telescope**: Primary fuzzy finder with fzf extension
- **Git Integration**: Prefers git files over regular file search
- **Buffer Management**: Custom buffer display with full path context
- **Key Bindings**: All under `<leader>f` prefix (ff, fg, fw, fd, etc.)

## Key Keymaps

### Global Keymaps (init.lua)
- `<Space>`: Leader key
- `<C-s>`: Save (normal and insert mode)
- `<C-arrows>`: Window navigation
- `[b]`/`]b`: Buffer navigation
- `[d]`/`]d`: Diagnostic navigation
- `<leader>cc`: Toggle Claude Code

### LSP Keymaps (when LSP is attached)
- `gd`: Go to definition (telescope)
- `gr`: Go to references (telescope)
- `gI`: Go to implementation (telescope)
- `<leader>D`: Type definition (telescope)
- `<leader>rn`: Rename symbol
- `<leader>.`: Code action

### Telescope Keymaps
- `<leader>ff`: Find files (git files)
- `<leader>fg`: Live grep
- `<leader>fw`: Find current word
- `<leader>fd`: Find diagnostics
- `<leader>fn`: Find Neovim config files
- `<leader><leader>`: Buffer list

## Development Commands

### Plugin Management
```bash
# Open lazy.nvim interface
:Lazy

# Update plugins
:Lazy update

# Install new plugins
:Lazy install
```

### LSP Management
```bash
# Open Mason interface
:Mason

# Install LSP servers
:MasonInstall <server-name>

# LSP information
:LspInfo
```

### Formatting
```bash
# Format current buffer
:ConformInfo  # Check formatter status
# Auto-format on save is enabled by default
```

## Configuration Patterns

### Plugin Structure
Each plugin file in `lua/plugins/` should return a table with:
- Plugin spec (name, dependencies, config)
- Lazy loading configuration (event, cmd, ft, keys)
- Setup function or opts table

### Adding New Plugins
1. Create new file in `lua/plugins/plugin-name.lua`
2. Return plugin spec table
3. Configure lazy loading appropriately
4. Add keymaps if needed

### LSP Configuration
- Add new servers to `servers` table in `lua/plugins/lsp-config.lua:183`
- Ensure formatters are added to `mason-tool-installer` ensure_installed list
- Add formatter configuration to `lua/plugins/autoformat.lua:33`

## Special Integrations

### Claude Code Integration
- Plugin: `claude-code.nvim`
- Toggle: `<leader>cc` or `<C-,>`
- Variants: `<leader>cC` (continue), `<leader>cV` (verbose)
- Auto-refresh enabled with file change detection

### Git Integration
- Gitsigns for git status in gutter
- Diffview for git diff visualization  
- Telescope git integration for file finding

### TypeScript Development
- typescript-tools.nvim for enhanced TypeScript support
- ESLint integration for linting
- Prettier formatting via conform.nvim
- Auto-format on save enabled