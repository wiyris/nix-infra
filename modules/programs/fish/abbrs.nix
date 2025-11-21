{
  programs.fish = {
    shellAbbrs = {
      k = "killall";
      kn = "killall -9";

      nf = "nix flake";
      nfc = "nix flake check";
      nfu = "nix flake update";
      npr = "nixpkgs-review pr --run fish --print-result";
      nd = "nix develop --command fish";
      nb = "nix build";
      ns = "nix shell";
      nr = "nix run";
      ncg = "sudo nix-collect-garbage -d && nix-collect-garbage -d";
      nvd = "nvd --color always diff /run/current-system result | rg -v 0.0.0 | less -R";
      sw = "nh os switch";
      # sw = "nh os switch --ask";

      mc = "mullvad connect";
      md = "mullvad disconnect";
      mr = "mullvad reconnect";
      ms = "mullvad status";
    };
    functions = {
      wav2flac =
        # fish
        ''
          set ORIGINAL_SIZE (du -hs | cut -f1)

          fd -e wav -x ffmpeg -i "file:{}" -loglevel quiet -stats "file:{.}.flac"
          fd -e wav -X trash

          set NEW_SIZE (du -hs | cut -f1)

          echo "Done. Reduced file size from $ORIGINAL_SIZE to $NEW_SIZE"
        '';

      opus =
        # fish
        ''
          set ORIGINAL_SIZE (du -hs | cut -f1)

          fd -e wav -e flac -x ffmpeg -i "file:{}" -c:a libopus -b:a 128K -loglevel quiet -stats "file:{.}.opus"
          fd -e wav -e flac -X rm -I

          set NEW_SIZE (du -hs | cut -f1)

          echo "Done. Reduced file size from $ORIGINAL_SIZE to $NEW_SIZE"
        '';

      mullvad-init =
        # fish
        ''
          mullvad auto-connect set on
          mullvad lan set allow
          mullvad relay set location jp
          mullvad lockdown-mode set on
          mullvad account login "$argv"
        '';
    };
  };
}
