return {
  "RRethy/base16-nvim",

  config = function ()
    require('base16-colorscheme').setup({
      -- Default Background
      base00 = "{{ colors.surface.default.hex }}",
      -- Lighter Background (Status bars)
      base01 = "{{ colors.surface_container_lowest.default.hex }}",
      -- Selection Background
      base02 = "{{ colors.surface_container_low.default.hex }}",
      -- Comments, Invisibles
      base03 = "{{ colors.outline.default.hex }}",
      -- Dark Foreground (Used for status bars)
      base04 = "{{ colors.on_surface_variant.default.hex }}",
      -- Default Foreground, Caret, Delimiters
      base05 = "{{ colors.on_surface.default.hex }}",
      -- Light Foreground
      base06 = "{{ colors.inverse_on_surface.default.hex }}",
      -- Light Background
      base07 = "{{ colors.surface_bright.default.hex }}",
      -- Variables, XML Tags, Red
      base08 = "{{ colors.tertiary.default.hex | lighten: -5 }}",
      -- Integers, Boolean, Constants, Orange
      base09 = "{{ colors.tertiary.default.hex }}",
      -- Classes, Strings, Functions, Yellow
      base0A = "{{ colors.secondary.default.hex }}",
      -- Strings, Inherited Class, Green
      base0B = "{{ colors.primary.default.hex }}",
      -- Support, Regex, Escape Characters, Cyan
      base0C = "{{ colors.on_tertiary_container.default.hex }}",
      -- Functions, Methods, Attribute IDs, Blue
      base0D = "{{ colors.on_primary_container.default.hex }}",
      -- Keywords, Storage, Selector, Magenta
      base0E = "{{ colors.on_secondary_container.default.hex }}",
      -- Deprecated, Opening/Closing Embedded Tags, Brown
      base0F = "{{ colors.secondary.default.hex | lighten: -10 }}",
    })

    -- Make selected text stand out more
    vim.api.nvim_set_hl(0, 'Visual', {
      bg = '{{ colors.on_secondary_container.default.hex }}',
      fg = '{{ colors.background.default.hex }}',
    })

    -- Why doesn't this do anything?
    require('base16-colorscheme').with_config({
      telescope = false,
    })
  end
}

