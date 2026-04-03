{ config, pkgs, inputs, lib, stdenv,  ... }:

{
  home.username = "arshes";
  home.homeDirectory = "/home/arshes";
  home.stateVersion = "25.11";

  # Git configuration
  programs.git = {
    enable = true;
    settings = {
      user.name = "drksch";
      user.email = "add me after@install";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  # Zsh Shell
   programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      EDITOR = "hx";
    };
      
    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch --flake ~/.config/nixos#$(hostname)";
      upgrade = "nix flake update ~/.config/nixos && sudo nixos-rebuild switch --flake ~/.config/nixos#$(hostname)";
    };

    oh-my-zsh = {
      enable = true;
      # theme = "robbyrussell";
      plugins = [ "git" "sudo" "fzf" ];
    };
  };

  
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
        set -g default-terminal "tmux-256color"
        set -ga terminal-overrides ",*:RGB"
        set -g mouse on
        set -g set-clipboard on
            
        unbind C-b
        set -g prefix C-a
        bind-key C-a send-prefix
        
        # Vim like pane selection
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        
        unbind %
        bind | split-window -h -c "#{pane_current_path}"
        
        unbind '"'
        bind - split-window -v -c "#{pane_current_path}"
        
        unbind r
        bind r source-file $HOME/.config/tmux/tmux.conf
        
        # Change from 0 based to 1 based because keyboard layout
        set -g base-index 1
        set -g pane-base-index 1
        set-window-option -g pane-base-index 1
        set-option -g renumber-windows on
        
        # Vim-like copy/paste
        set-window-option -g mode-keys vi
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        unbind -T copy-mode-vi MouseDragEnd1Pane
        
        # Use Alt-arrow keys without prefix key to switch panes
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D
        
        # Shift arrow to switch windows
        bind -n S-Left  previous-window
        bind -n S-Right next-window
        
        # set -g @tokyonight_flavour 'storm'
        # set -g @tokyonight_flavour 'night'
        set -g @tokyonight_flavour 'moon'
        
        set -g @plugin 'tmux-plugins/tpm'
        set -g @plugin 'tmux-plugins/tmux-sensible'
        set -g @plugin 'christoomey/vim-tmux-navigator'
        set -g @plugin 'tmux-plugins/tmux-yank'
        set -g @plugin 'tonybanters/tokyonight-tmux'
        
        run '~/.tmux/plugins/tpm/tpm'
        # run-shell '~/.local/share/tmux/plugins/tpm/tpm'                  
      '';
  };

  programs.yazi = {
    enable = true;
      settings = {
        opener = {
          text = [
            {
          run = "'${lib.getExe pkgs.helix} \"$@\"'";
          block = true;
            }
          ];
      };
    };
  };


  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    nodejs
    gcc
  ];
}
