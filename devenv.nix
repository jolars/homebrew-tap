{ pkgs, ... }:

{
  packages = [
    pkgs.docker-client
    pkgs.shellcheck
  ];

  tasks."tap:check" = {
    description = "Run host-side checks for the formula scripts";
    exec = ''
      shellcheck scripts/*.sh tests/*.sh
      tests/test-formula-in-brew.sh
      tests/test-render-formula.sh
    '';
    before = [ "devenv:enterTest" ];
    showOutput = true;
  };

  tasks."tap:test" = {
    description = "Validate a formula in the official Homebrew container";
    exec = ''
      formula="$(${pkgs.jq}/bin/jq -r '.formula' <<<"$DEVENV_TASK_INPUT")"
      if [[ "$formula" == "all" ]]; then
        exec scripts/test-formula-in-brew.sh
      fi
      exec scripts/test-formula-in-brew.sh "$formula"
    '';
    input.formula = "all";
    after = [ "tap:check" ];
    showOutput = true;
  };
}
