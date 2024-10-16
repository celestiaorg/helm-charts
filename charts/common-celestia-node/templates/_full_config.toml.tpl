{{- define "common-celestia-node.full_config.toml" -}}
[Node]
  StartupTimeout = "{{ .Values.node.config.full.configtoml.Node.StartupTimeout }}"
  ShutdownTimeout = "{{ .Values.node.config.full.configtoml.Node.ShutdownTimeout }}"
[Core]
  IP = "{{ .Values.node.config.full.configtoml.Core.IP }}"
  RPCPort = "{{ .Values.node.config.full.configtoml.Core.RPCPort }}"
  GRPCPort = "{{ .Values.node.config.full.configtoml.Core.GRPCPort }}"
[State]
  DefaultKeyName = "{{ .Values.node.config.full.configtoml.State.DefaultKeyName }}"
  DefaultBackendName = "{{ .Values.node.config.full.configtoml.State.DefaultBackendName }}"
[P2P]
  ListenAddresses = [{{ range $index, $element := .Values.node.config.full.configtoml.P2P.ListenAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  AnnounceAddresses = {{ .Values.node.config.full.configtoml.P2P.AnnounceAddresses }}
  NoAnnounceAddresses = [{{ range $index, $element := .Values.node.config.full.configtoml.P2P.NoAnnounceAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  MutualPeers = {{ .Values.node.config.full.configtoml.P2P.MutualPeers }}
  PeerExchange = {{ .Values.node.config.full.configtoml.P2P.PeerExchange }}
  RoutingTableRefreshPeriod = "{{ .Values.node.config.full.configtoml.P2P.RoutingTableRefreshPeriod }}"
  [P2P.ConnManager]
    Low = {{ printf "%.0f" .Values.node.config.full.configtoml.P2P.ConnManager.Low }}
    High = {{ printf "%.0f" .Values.node.config.full.configtoml.P2P.ConnManager.High }}
    GracePeriod = "{{ .Values.node.config.full.configtoml.P2P.ConnManager.GracePeriod }}"
[RPC]
  Address = "{{ .Values.node.config.full.configtoml.RPC.Address }}"
  Port = "{{ .Values.node.config.full.configtoml.RPC.Port }}"
  SkipAuth = {{ .Values.node.config.full.configtoml.RPC.SkipAuth }}
[Gateway]
  Address = "{{ .Values.node.config.full.configtoml.Gateway.Address }}"
  Port = "{{ .Values.node.config.full.configtoml.Gateway.Port }}"
  Enabled = {{ .Values.node.config.full.configtoml.Gateway.Enabled }}
[Share]
  UseShareExchange = {{ .Values.node.config.full.configtoml.Share.UseShareExchange }}
  [Share.EDSStoreParams]
    GCInterval = "{{ .Values.node.config.full.configtoml.Share.EDSStoreParams.GCInterval }}"
    RecentBlocksCacheSize = {{ printf "%.0f" .Values.node.config.full.configtoml.Share.EDSStoreParams.RecentBlocksCacheSize }}
    BlockstoreCacheSize = {{ printf "%.0f" .Values.node.config.full.configtoml.Share.EDSStoreParams.BlockstoreCacheSize }}
  [Share.ShrExEDSParams]
    ServerReadTimeout = "{{ .Values.node.config.full.configtoml.Share.ShrExEDSParams.ServerReadTimeout }}"
    ServerWriteTimeout = "{{ .Values.node.config.full.configtoml.Share.ShrExEDSParams.ServerWriteTimeout }}"
    HandleRequestTimeout = "{{ .Values.node.config.full.configtoml.Share.ShrExEDSParams.HandleRequestTimeout }}"
    ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.full.configtoml.Share.ShrExEDSParams.ConcurrencyLimit }}
    BufferSize = {{ printf "%.0f" .Values.node.config.full.configtoml.Share.ShrExEDSParams.BufferSize }}
  [Share.ShrExNDParams]
    ServerReadTimeout = "{{ .Values.node.config.full.configtoml.Share.ShrExNDParams.ServerReadTimeout }}"
    ServerWriteTimeout = "{{ .Values.node.config.full.configtoml.Share.ShrExNDParams.ServerWriteTimeout }}"
    HandleRequestTimeout = "{{ .Values.node.config.full.configtoml.Share.ShrExNDParams.HandleRequestTimeout }}"
    ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.full.configtoml.Share.ShrExNDParams.ConcurrencyLimit }}
  [Share.PeerManagerParams]
    PoolValidationTimeout = "{{ .Values.node.config.full.configtoml.Share.PeerManagerParams.PoolValidationTimeout }}"
    PeerCooldown = "{{ .Values.node.config.full.configtoml.Share.PeerManagerParams.PeerCooldown }}"
    GcInterval = "{{ .Values.node.config.full.configtoml.Share.PeerManagerParams.GcInterval }}"
    EnableBlackListing = {{ .Values.node.config.full.configtoml.Share.PeerManagerParams.EnableBlackListing }}
  [Share.Discovery]
    PeersLimit = {{ printf "%.0f" .Values.node.config.full.configtoml.Share.Discovery.PeersLimit }}
    AdvertiseInterval = "{{ .Values.node.config.full.configtoml.Share.Discovery.AdvertiseInterval }}"
[Header]
  TrustedHash = "{{ .Values.node.config.full.configtoml.Header.TrustedHash }}"
  TrustedPeers = {{ .Values.node.config.full.configtoml.Header.TrustedPeers }}
  [Header.Store]
    StoreCacheSize = {{ printf "%.0f" .Values.node.config.full.configtoml.Header.Store.StoreCacheSize }}
    IndexCacheSize = {{ printf "%.0f" .Values.node.config.full.configtoml.Header.Store.IndexCacheSize }}
    WriteBatchSize = {{ printf "%.0f" .Values.node.config.full.configtoml.Header.Store.WriteBatchSize }}
  [Header.Syncer]
    TrustingPeriod = "{{ .Values.node.config.full.configtoml.Header.Syncer.TrustingPeriod }}"
  [Header.Server]
    WriteDeadline = "{{ .Values.node.config.full.configtoml.Header.Server.WriteDeadline }}"
    ReadDeadline = "{{ .Values.node.config.full.configtoml.Header.Server.ReadDeadline }}"
    RangeRequestTimeout = "{{ .Values.node.config.full.configtoml.Header.Server.RangeRequestTimeout }}"
  [Header.Client]
    MaxHeadersPerRangeRequest = {{ printf "%.0f" .Values.node.config.full.configtoml.Header.Client.MaxHeadersPerRangeRequest }}
    RangeRequestTimeout = "{{ .Values.node.config.full.configtoml.Header.Client.RangeRequestTimeout }}"
[DASer]
  SamplingRange = {{ printf "%.0f" .Values.node.config.full.configtoml.DASer.SamplingRange }}
  ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.full.configtoml.DASer.ConcurrencyLimit }}
  BackgroundStoreInterval = "{{ .Values.node.config.full.configtoml.DASer.BackgroundStoreInterval }}"
  SampleFrom = {{ printf "%.0f" .Values.node.config.full.configtoml.DASer.SampleFrom }}
  SampleTimeout = "{{ .Values.node.config.full.configtoml.DASer.SampleTimeout }}"
[Pruner]
  EnableService = {{ .Values.node.config.full.configtoml.Pruner.EnableService }}
{{- end }}
