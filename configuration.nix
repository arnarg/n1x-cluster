{...}: {
  # We want to enable ArgoCD
  services.argocd.enable = true;
  services.argocd.ingress = {
    enable = true;
    ingressClass = "traefik";
  };
  services.argocd.values = {
    configs.params."server.insecure" = true;
  };

  # Enable app of apps application
  n1x.appOfApps.enable = true;
  n1x.appOfApps.repository = "https://github.com/arnarg/n1x-cluster.git";

  # Enable bootstrap application
  n1x.bootstrap.enable = true;

  # Set applications in bootstrap
  applications.argocd.inBootstrap = true;
}
