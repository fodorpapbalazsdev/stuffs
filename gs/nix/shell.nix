with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "test node";
    buildInputs = [
        nodejs
    ];
    shellHook = ''
        export PATH="$PWD/node_modules/.bin/:$PATH"
        echo Well done, $MY_ENVIRONMENT_VARIABLE
        node --version
    '';

  MY_ENVIRONMENT_VARIABLE = "now nix is running inside vagrant and node installed";
}