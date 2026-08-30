{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "minusKou";
        email = "32330840+minusKou@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
