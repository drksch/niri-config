{  
    programs.starship = {
      enable = true;
      settings = {
        # "$schema" = "https://starship.rs/config-schema.json";
        add_newline = true;
        command_timeout = 500;
        continuation_prompt = "[∙](bright-black) ";
        format = "[╭╴](fg:#505050)$os$shell$username$hostname$sudo$directory$direnv$php$python$git_branch$git_commit$git_state$git_metrics$git_status[ ](fg:#252525)$fill$fill[ ](fg:#252525)$status$jobs$memory_usage$cmd_duration$line_break[╰╴](fg:#505050)$character($style)";
        right_format = "[$localip]($style)";
        scan_timeout = 30;

        os = {
            format = "[](fg:#252525)[$symbol]($style)(bg:#252525)";
            style =  "fg:#AAAAAA bg:#252525";
            disabled = false;
            };
        
        os.symbols = {
            AIX = "➿ ";
            Alpaquita = "🔔 ";
            AlmaLinux = " ";        # nf-linux-almalinux
            Alpine = " ";           # nf-linux-alpine
            Amazon = "🙂 ";
            Android = " ";          # nf-fa-android
            Arch = " ";             # nf-linux-archlinux
            Artix = " ";            # nf-linux-artix
            Bluefin = "🐟 ";
            CachyOS = "🎗️ ";
            CentOS = " ";           # nf-linux-centos
            Debian = " ";           # nf-linux-debian
            DragonFly = "🐉 ";
            Emscripten = "🔗 ";
            EndeavourOS = " ";      # nf-linux-endeavour
            Fedora = " ";          # nf-linux-fedora
            FreeBSD = " ";          # nf-linux-freebsd
            Garuda = " ";           # nf-linux-garuda
            Gentoo = " ";           # nf-linux-gentoo
            HardenedBSD = "🛡️ ";
            Illumos = " ";          # nf-linux-illumos
            Kali = " ";             # nf-linux-kali_linux
            Linux = " ";            # nf-linux-tux
            Mabox = "📦 ";
            Macos = " ";            # nf-linux-apple
            Manjaro = " ";          # nf-linux-manjaro
            Mariner = "🌊 ";
            MidnightBSD = "🌘 ";
            Mint = " ";             # nf-linux-linuxmint
            NetBSD = "🚩 ";
            NixOS = " ";            # nf-linux-nixos
            Nobara = " ";           # nf-linux-nobara
            OpenBSD = " ";          # nf-linux-openbsd
            OpenCloudOS = "☁️ ";
            openEuler = "🦉 ";
            openSUSE = " ";         # nf-linux-opensuse
            OracleLinux = " ";      # nf-dev-oracle
            Pop = " ";              # nf-linux-pop_os
            Raspbian = " ";         # nf-linux-raspberry_pi
            Redhat = " ";           # nf-linux-redhat
            RedHatEnterprise = " "; # nf-linux-redhat
            RockyLinux = " ";       # nf-linux-rocky_linux
            Redox = "🧪 ";
            Solus = " ";            # nf-linux-solus
            SUSE = " ";            # nf-fa-suse
            Ubuntu = " ";           # nf-linux-ubuntu
            Ultramarine = "🔷 ";
            Unknown = "❓ ";
            Uos = "🐲 ";
            Void = " ";             # nf-linux-void
            Windows = " ";          # nf-custom-windows
            };
        shell = {
            format = "[$indicator]($style)()";
            style = "fg:#424242 bg:#252525";
            # empty indicator (""): e.g. if you do not want to see indicator for your standard shell
            zsh_indicator = "%_";  #  %_  󰰶  
            bash_indicator = "$_";  #    $_ 
            fish_indicator = ">>";  #  󰈺  >>_ 
            powershell_indicator = ">_";  #    >_
            unknown_indicator = "?_";  #  ?_    
            disabled = false; # set to false if you want to see the shell indicator
            }; 
        username = {
            format = "[ ](fg:green bold bg:#252525)[$user]($style)[ ](bg:#252525)";
            style_user = "fg:green bold bg:#252525";
            style_root = "fg:red bold bg:#252525";
            show_always = false;
            disabled = false;
            };
        hostname = {
            format = "[$ssh_symbol ](fg:green bold bg:#252525)[$hostname](fg:green bold bg:#252525)[ ](bg:#252525)";
            ssh_only = true;
            ssh_symbol = ""; # ⇒ #   # ﬁ⇒
            #trim_at = ".companyname.com";
            disabled = false;
            };
        sudo = {
            format = "[ ](fg:red bold bg:#252525)[as $symbol]($style)";
            style = "fg:red bold bg:#252525";
            symbol = ""; #  ❯
            disabled = false;
            };
        directory = {
            format = "[ ](fg:cyan bold bg:#252525)[$read_only]($read_only_style)[$repo_root]($repo_root_style)[$path ]($style)";
            style = "fg:cyan bold bg:#252525";
            home_symbol = " ~";
            read_only = " "; # " " # " ""
            read_only_style = "fg:cyan bg:#252525";
            truncation_length = 3;
            truncation_symbol = "…/";
            truncate_to_repo = true;
            repo_root_format = "[ ](fg:cyan bold bg:#252525)[$read_only]($read_only_style)[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path ]($style)";
            repo_root_style	= "fg:cyan bold bg:#252525";
            use_os_path_sep = true;
            disabled = false;
            };
        direnv = {
            symbol = "direnv";
            style = "fg:#505050 bold bg:#252525";
            format = "[❯ $symbol $loaded/$allowed ]($style)";
            allowed_msg = "a"; # "ok" # "✓"
            not_allowed_msg = "!a"; # "nok" # "!"
            denied_msg = "x"; # "✘"
            loaded_msg = "+"; # "\ueabc" # \ueabc  # "->" # "yo" # "󰗡" # \udb81\udde1 # "󱥸✓" # "󱥸✓" # 
            unloaded_msg = "-"; # "\ueabc!" # \ueabc ! # "->!" # "no" # "󰅚" # "󱥸!" \udb86\udd78
            disabled = false;
            };
        php = {
            format = "[[ 〉](fg:#7a86b8 bg:#252525)[$symbol](fg:#7a86b8 italic bg:#252525)($version )]($style)";
            style = "fg:#7a86b8 bg:#252525)";
            symbol = "php "; # \ue73d  # 󰌟
            };
        python = {
            format = "[$symbol$pyenv_prefix($version )(($virtualenv) )]($style)";
            style = "fg:yellow bg:#252525";
            symbol = " "; # 
            pyenv_version_name = true;
            };
        git_branch = {
            format = "[❯ $symbol $branch(:$remote_branch)]($style)[ ](bg:#252525)";
            style = "fg:#E04D27 bg:#252525";
            symbol = "";
            #ignore_branches = ["master", "main"]
            };
        git_commit = {
            format = "[\($hash$tag\)]($style)[ ](bg:#252525)";
            style = "fg:#E04D27 bg:#252525";
            commit_hash_length = 8;
            tag_symbol = "  "; # "  ""
            tag_disabled = false;
            disabled = false;
            };
        git_metrics = {
            format = "[\[+$added/]($added_style)[-$deleted\]()]($deleted_style)[ ](bg:#252525)";
            added_style = "fg:#E04D27 bg:#252525";
            deleted_style = "fg:#E04D27 bg:#252525";
            disabled = false;
            };
        git_status = {
            format = "([$all_status$ahead_behind]($style))";
            style = "fg:#E04D27 bg:#252525";
            conflicted = "[$count ](fg:red bg:#252525)";
            ahead = "[⇡$count ](fg:yellow bg:#252525)";
            behind = "[⇣$count ](fg:yellow bg:#252525)";
            diverged = "[⇕$ahead_count⇡$behind_count⇣ ](fg:yellow bg:#252525)"; # ⇕ ↕ ⇳ 󰹹 󰹺 󰧈
            up_to_date = "[✓ ](fg:green bg:#252525)";
            untracked = "[ﳇ$count ](fg:red bg:#252525)"; # " " # "? "
            stashed = "[$count ](fg:#A52A2A bg:#252525)"; # " "# " " # " " # " " # " "
            modified = "[󰷉$count ](fg:#C8AC00 bg:#252525)"; # "📝" # "! " #  #  # 
            staged = "[$count ](fg:green bg:#252525)"; # "+ "
            renamed = "[$count ](fg:yellow bg:#252525)";
            deleted = "[﯊$count ](fg:orange bg:#252525)"; # "🗑 " "- "
            disabled = false;
            };
        fill = {
            style = "fg:#505050";
            symbol = "─"; # "\u2500" # "\u2500"  # no line: " "
            };
        status = {
            format = "[$symbol $status $hex_status(  $signal_number-$signal_name)]($style)";
            style = "fg:red bg:#252525";
            symbol = " ✘";
            disabled = false;
            };
        jobs = {
            format = "[  ](fg:blue bold bg:#252525)[$symbol $number]($style)";
            style = "fg:blue bg:#252525";
            symbol = "󰜎"; #"\ueb7b" # \ueb7b  \uef0c 省 # "廒" #  # ""
            symbol_threshold = 1;
            number_threshold = 2;
            disabled = false;
            };
        memory_usage = {            
            format = "[  ](fg:purple bold bg:#252525)[$symbol $ram $swap]($style)";
            style = "fg:purple bg:#252525";
            symbol = "﬙ / 󰾵"; # "﬙ 北" # "﬙ 痢" #  # "󰍛 󰾵" # "﬙ 󰾴" # "﬙ 󰾶" # "﬙ 󰾷" "﬙ 󰣂"
            threshold = 75;
            disabled = false;
            };
        cmd_duration = {
            format = "[   $duration]($style)"; #     
            style = "fg:yellow bg:#252525";
            min_time = 500;
            disabled = false;
            };
        localip = {
            format = "[$localipv4](fg:green bold)";
            ssh_only = true;
            disabled = false;
            };
        };  
    };
}
