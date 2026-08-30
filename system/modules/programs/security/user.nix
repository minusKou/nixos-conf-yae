{ ... }:
{
  # User account
  users.users."alhanz" = {
    isNormalUser = true;
    description = "alhanz";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}