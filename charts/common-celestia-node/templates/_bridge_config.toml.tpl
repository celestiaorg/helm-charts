{{- define "common-celestia-node.bridge_config.toml" -}}
[Node]
  StartupTimeout = "{{ .Values.node.config.bridge.configtoml.Node.StartupTimeout }}"
  ShutdownTimeout = "{{ .Values.node.config.bridge.configtoml.Node.ShutdownTimeout }}"
[Core]
  IP = "{{ .Values.node.config.bridge.configtoml.Core.IP }}"
  RPCPort = "{{ .Values.node.config.bridge.configtoml.Core.RPCPort }}"
  GRPCPort = "{{ .Values.node.config.bridge.configtoml.Core.GRPCPort }}"
[State]
  DefaultKeyName = "{{ .Values.node.config.bridge.configtoml.State.DefaultKeyName }}"
  DefaultBackendName = "{{ .Values.node.config.bridge.configtoml.State.DefaultBackendName }}"
[P2P]
  ListenAddresses = [{{ range $index, $element := .Values.node.config.bridge.configtoml.P2P.ListenAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  AnnounceAddresses = {{ .Values.node.config.bridge.configtoml.P2P.AnnounceAddresses }}
  NoAnnounceAddresses = [{{ range $index, $element := .Values.node.config.bridge.configtoml.P2P.NoAnnounceAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  MutualPeers = {{ .Values.node.config.bridge.configtoml.P2P.MutualPeers }}
  PeerExchange = {{ .Values.node.config.bridge.configtoml.P2P.PeerExchange }}
  RoutingTableRefreshPeriod = "{{ .Values.node.config.bridge.configtoml.P2P.RoutingTableRefreshPeriod }}"
  [P2P.ConnManager]
    Low = {{ printf "%.0f" .Values.node.config.bridge.configtoml.P2P.ConnManager.Low }}
    High = {{ printf "%.0f" .Values.node.config.bridge.configtoml.P2P.ConnManager.High }}
    GracePeriod = "{{ .Values.node.config.bridge.configtoml.P2P.ConnManager.GracePeriod }}"
[RPC]
  Address = "{{ .Values.node.config.bridge.configtoml.RPC.Address }}"
  Port = "{{ .Values.node.config.bridge.configtoml.RPC.Port }}"
  SkipAuth = {{ .Values.node.config.bridge.configtoml.RPC.SkipAuth }}
[Gateway]
  Address = "{{ .Values.node.config.bridge.configtoml.Gateway.Address }}"
  Port = "{{ .Values.node.config.bridge.configtoml.Gateway.Port }}"
  Enabled = {{ .Values.node.config.bridge.configtoml.Gateway.Enabled }}
[Share]
  UseShareExchange = {{ .Values.node.config.bridge.configtoml.Share.UseShareExchange }}
  [Share.EDSStoreParams]
    GCInterval = "{{ .Values.node.config.bridge.configtoml.Share.EDSStoreParams.GCInterval }}"
    RecentBlocksCacheSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.EDSStoreParams.RecentBlocksCacheSize }}
    BlockstoreCacheSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.EDSStoreParams.BlockstoreCacheSize }}
  [Share.ShrExEDSParams]
    ServerReadTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrExEDSParams.ServerReadTimeout }}"
    ServerWriteTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrExEDSParams.ServerWriteTimeout }}"
    HandleRequestTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrExEDSParams.HandleRequestTimeout }}"
    ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.ShrExEDSParams.ConcurrencyLimit }}
    BufferSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.ShrExEDSParams.BufferSize }}
  [Share.ShrExNDParams]
    ServerReadTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrExNDParams.ServerReadTimeout }}"
    ServerWriteTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrExNDParams.ServerWriteTimeout }}"
    HandleRequestTimeout = "{{ .Values.node.config.bridge.configtoml.Share.ShrExNDParams.HandleRequestTimeout }}"
    ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.ShrExNDParams.ConcurrencyLimit }}
  [Share.PeerManagerParams]
    PoolValidationTimeout = "{{ .Values.node.config.bridge.configtoml.Share.PeerManagerParams.PoolValidationTimeout }}"
    PeerCooldown = "{{ .Values.node.config.bridge.configtoml.Share.PeerManagerParams.PeerCooldown }}"
    GcInterval = "{{ .Values.node.config.bridge.configtoml.Share.PeerManagerParams.GcInterval }}"
    EnableBlackListing = {{ .Values.node.config.bridge.configtoml.Share.PeerManagerParams.EnableBlackListing }}
  [Share.Discovery]
    PeersLimit = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Share.Discovery.PeersLimit }}
    AdvertiseInterval = "{{ .Values.node.config.bridge.configtoml.Share.Discovery.AdvertiseInterval }}"
[Header]
  TrustedHash = "{{ .Values.node.config.bridge.configtoml.Header.TrustedHash }}"
  TrustedPeers = {{ .Values.node.config.bridge.configtoml.Header.TrustedPeers }}
  [Header.Store]
    StoreCacheSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Store.StoreCacheSize }}
    IndexCacheSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Store.IndexCacheSize }}
    WriteBatchSize = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Store.WriteBatchSize }}
  [Header.Syncer]
    TrustingPeriod = "{{ .Values.node.config.bridge.configtoml.Header.Syncer.TrustingPeriod }}"
  [Header.Server]
    WriteDeadline = "{{ .Values.node.config.bridge.configtoml.Header.Server.WriteDeadline }}"
    ReadDeadline = "{{ .Values.node.config.bridge.configtoml.Header.Server.ReadDeadline }}"
    RangeRequestTimeout = "{{ .Values.node.config.bridge.configtoml.Header.Server.RangeRequestTimeout }}"
  [Header.Client]
    MaxHeadersPerRangeRequest = {{ printf "%.0f" .Values.node.config.bridge.configtoml.Header.Client.MaxHeadersPerRangeRequest }}
    RangeRequestTimeout = "{{ .Values.node.config.bridge.configtoml.Header.Client.RangeRequestTimeout }}"
[Pruner]
  EnableService = {{ .Values.node.config.bridge.configtoml.Pruner.EnableService }}
{{- end }}
