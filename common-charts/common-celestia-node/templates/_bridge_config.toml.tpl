{{ define "common-celestia-node.bridge_config.toml" }}
[Node]
  StartupTimeout = "{{ .Values.node.config.bridge.configtoml.Node.StartupTimeout }}"
  ShutdownTimeout = "{{ .Values.node.config.bridge.configtoml.Node.ShutdownTimeout }}"
[Core]
  IP = "{{ .Values.node.config.bridge.configtoml.Core.IP }}"
  Port = "{{ .Values.node.config.bridge.configtoml.Core.Port }}"
  TLSEnabled = {{ .Values.node.config.bridge.configtoml.Core.TLSEnabled }}
  XTokenPath = "{{ .Values.node.config.bridge.configtoml.Core.XTokenPath }}"
  AdditionalCoreEndpoints = {{ .Values.node.config.bridge.configtoml.Core.AdditionalCoreEndpoints }}
[State]
  DefaultKeyName = "{{ .Values.node.config.bridge.configtoml.State.DefaultKeyName }}"
  DefaultBackendName = "{{ .Values.node.config.bridge.configtoml.State.DefaultBackendName }}"
  EstimatorAddress = "{{ .Values.node.config.bridge.configtoml.State.EstimatorAddress }}"
  EnableEstimatorTLS = {{ .Values.node.config.bridge.configtoml.State.EnableEstimatorTLS }}
[P2P]
  ListenAddresses = [{{ range $index, $element := .Values.node.config.bridge.configtoml.P2P.ListenAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  AnnounceAddresses = {{ .Values.node.config.bridge.configtoml.P2P.AnnounceAddresses }}
  NoAnnounceAddresses = [{{ range $index, $element := .Values.node.config.bridge.configtoml.P2P.NoAnnounceAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  MutualPeers = {{ .Values.node.config.bridge.configtoml.P2P.MutualPeers }}
  PeerExchange = {{ .Values.node.config.bridge.configtoml.P2P.PeerExchange }}
  [P2P.ConnManager]
    Low = {{ printf "%.0f" .Values.node.config.bridge.configtoml.P2P.ConnManager.Low }}
    High = {{ printf "%.0f" .Values.node.config.bridge.configtoml.P2P.ConnManager.High }}
    GracePeriod = "{{ .Values.node.config.bridge.configtoml.P2P.ConnManager.GracePeriod }}"
[RPC]
  Address = "{{ .Values.node.config.bridge.configtoml.RPC.Address }}"
  Port = "{{ .Values.node.config.bridge.configtoml.RPC.Port }}"
  SkipAuth = {{ .Values.node.config.bridge.configtoml.RPC.SkipAuth }}
  [RPC.CORS]
    Enabled = {{ .Values.node.config.bridge.configtoml.RPC.CORS.Enabled }}
    AllowedOrigins = {{ .Values.node.config.bridge.configtoml.RPC.CORS.AllowedOrigins }}
    AllowedHeaders = {{ .Values.node.config.bridge.configtoml.RPC.CORS.AllowedHeaders }}
    AllowedMethods = {{ .Values.node.config.bridge.configtoml.RPC.CORS.AllowedMethods }}
[Share]
  BlockStoreCacheSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.BlockStoreCacheSize }}
  UseShareExchange = {{ .Values.node.config.bridge.configtoml.Share.UseShareExchange }}
  UseBitswap = {{ .Values.node.config.bridge.configtoml.Share.UseBitswap }}
  [Share.EDSStoreParams]
    RecentBlocksCacheSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.EDSStoreParams.RecentBlocksCacheSize }}
  [Share.ShrexClient]
    ReadTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrexClient.ReadTimeout }}"
    WriteTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrexClient.WriteTimeout }}"
  [Share.ShrexServer]
    ReadTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrexServer.ReadTimeout }}"
    WriteTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrexServer.WriteTimeout }}"
    HandleRequestTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrexServer.HandleRequestTimeout }}"
    ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.ShrexServer.ConcurrencyLimit }}
  [Share.PeerManagerParams]
    PoolValidationTimeout = "{{ .Values.node.config.bridge.configtoml.Share.PeerManagerParams.PoolValidationTimeout }}"
    PeerCooldown = "{{ .Values.node.config.bridge.configtoml.Share.PeerManagerParams.PeerCooldown }}"
    GcInterval = "{{ .Values.node.config.bridge.configtoml.Share.PeerManagerParams.GcInterval }}"
    EnableBlackListing = {{ .Values.node.config.bridge.configtoml.Share.PeerManagerParams.EnableBlackListing }}
  [Share.Discovery]
    PeersLimit = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.Discovery.PeersLimit }}
    AdvertiseInterval = "{{ .Values.node.config.bridge.configtoml.Share.Discovery.AdvertiseInterval }}"
[Header]
  TrustedPeers = {{ .Values.node.config.bridge.configtoml.Header.TrustedPeers }}
  [Header.Store]
    StoreCacheSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Store.StoreCacheSize }}
    IndexCacheSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Store.IndexCacheSize }}
    WriteBatchSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Store.WriteBatchSize }}
  [Header.Syncer]
    PruningWindow = "{{ .Values.node.config.bridge.configtoml.Header.Syncer.PruningWindow }}"
    SyncFromHash = "{{ .Values.node.config.bridge.configtoml.Header.Syncer.SyncFromHash }}"
    SyncFromHeight = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Syncer.SyncFromHeight }}
  [Header.Server]
    WriteDeadline = "{{ .Values.node.config.bridge.configtoml.Header.Server.WriteDeadline }}"
    ReadDeadline = "{{ .Values.node.config.bridge.configtoml.Header.Server.ReadDeadline }}"
    RequestTimeout = "{{ .Values.node.config.bridge.configtoml.Header.Server.RequestTimeout }}"
  [Header.Client]
    MaxHeadersPerRangeRequest = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Client.MaxHeadersPerRangeRequest }}
    RequestTimeout = "{{ .Values.node.config.bridge.configtoml.Header.Client.RequestTimeout }}"

{{ end }}
