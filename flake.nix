{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };
  outputs = { self, nixpkgs }: {
    packages."aarch64-darwin".default = 
    let 
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
    in
    pkgs.buildEnv {
      name = "home-packages";
      paths = with pkgs; [
        # Shell and Version Control
        git
        gh
        tmux

        # Development Environment
        devenv
        neovim
        ripgrep

        # Programming Languages and Runtimes
        ## JavaScript/TypeScript
        nodejs
        bun
        ## Go
        go
        ## Haskell
        ghc
        cabal-install
        stack
        haskell-language-server
                

        # macOS Window Management
        yabai
        skhd

        
      ];
    };
  };
}
