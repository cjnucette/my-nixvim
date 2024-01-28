{
  description = "A nixvim configuration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    # codeium-nvim = {
    #   url = "github:Exafunction/codeium.nvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    conform-src = {
      url = "github:stevearc/conform.nvim";
      flake = false;
    };

    oil-nvim-src = {
      url = "github:stevearc/oil.nvim";
      flake = false;
    };

    statuscol-nvim-src = {
      url = "github:luukvbaal/statuscol.nvim";
      flake = false;
    };

    nvim-ufo-src = {
      url = "github:kevinhwang91/nvim-ufo";
      flake = false;
    };

    dropbar-nvim-src = {
      url = "github:Bekaboo/dropbar.nvim";
      flake = false;
    };

    neodev-nvim-src = {
      url = "github:folke/neodev.nvim";
      flake = false;
    };

    clear-action-nvim-src = {
      url = "github:luckasRanarison/clear-action.nvim";
      flake = false;
    };

    maximize-nvim-src = {
      url = "github:declancm/maximize.nvim";
      flake = false;
    };

    ai-nvim-src = {
      url = "github:gera2ld/ai.nvim";
      flake = false;
    };
	
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
    ...
  } @ inputs: let
    config = import ./config; # import the module directly
    nvimPluginsOverlay = final: prev: {
      vimPlugins =
        prev.vimPlugins
        // {
          oil-nvim = final.vimUtils.buildVimPlugin {
            name = "oil-nvim";
            src = inputs.oil-nvim-src;
            dontBuild = true;
          };

          conform = final.vimUtils.buildVimPlugin {
            name = "conform";
            src = inputs.conform-src;
            dontBuild = true;
          };

          statuscol-nvim = final.vimUtils.buildVimPlugin {
            name = "statuscol-nvim";
            src = inputs.statuscol-nvim-src;
          };

          nvim-ufo = final.vimUtils.buildVimPlugin {
            name = "nvim-ufo";
            src = inputs.nvim-ufo-src;
          };

          dropbar-nvim = final.vimUtils.buildVimPlugin {
            name = "dropbar-nvim";
            src = inputs.dropbar-nvim-src;
          };

          neodev-nvim = final.vimUtils.buildVimPlugin {
            name = "neodev-nvim";
            src = inputs.neodev-nvim-src;
          };

          clear-action-nvim = final.vimUtils.buildVimPlugin {
            name = "clear-action-nvim";
            src = inputs.clear-action-nvim-src;
          };

          maximize-nvim = final.vimUtils.buildVimPlugin {
            name = "maximize-nvim";
            src = inputs.maximize-nvim-src;
          };

          ai-nvim = final.vimUtils.buildVimPlugin {
            name = "ai-nvim";
            src = inputs.ai-nvim-src;
          };
        };
    };
  in
    flake-utils.lib.eachDefaultSystem (system: let
      nixvimLib = nixvim.lib.${system};
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          # inputs.codeium-nvim.overlays.${system}.default
          inputs.neovim-nightly-overlay.overlay
          nvimPluginsOverlay
        ];
        config.allowUnfree = true;
      };
      nixvim' = nixvim.legacyPackages.${system};
      nvim = nixvim'.makeNixvimWithModule {
        inherit pkgs;
        module = config;
        # You can use `extraSpecialArgs` to pass additional arguments to your module files
        extraSpecialArgs = {
          inherit self;
        };
      };
    in {
      checks = {
        # Run `nix flake check .` to verify that your config is not broken
        default = nixvimLib.check.mkTestDerivationFromNvim {
          inherit nvim;
          name = "A nixvim configuration";
        };
      };

      packages = {
        # Lets you run `nix run .` to start nixvim
        default = nvim;
      };
    });
}
