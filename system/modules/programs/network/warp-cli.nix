{ pkgs, ... }:
{
  services.cloudflare-warp.enable = false;
  environment.systemPackages = with pkgs; [
    cloudflare-warp
  ];
}
