{{- define "common-celestia-node.light_config.toml" -}}
[Node]
  StartupTimeout = "{{ .Values.node.config.light.configtoml.Node.StartupTimeout }}"
  ShutdownTimeout = "{{ .Values.node.config.light.configtoml.Node.ShutdownTimeout }}"
[Core]
  IP = "{{ .Values.node.config.light.configtoml.Core.IP }}"
  RPCPort = "{{ .Values.node.config.light.configtoml.Core.RPCPort }}"
  GRPCPort = "{{ .Values.node.config.light.configtoml.Core.GRPCPort }}"
[State]
  DefaultKeyName = "{{ .Values.node.config.light.configtoml.State.DefaultKeyName }}"
  DefaultBackendName = "{{ .Values.node.config.light.configtoml.State.DefaultBackendName }}"
[P2P]
  ListenAddresses = [{{ range $index, $element := .Values.node.config.light.configtoml.P2P.ListenAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  AnnounceAddresses = {{ .Values.node.config.light.configtoml.P2P.AnnounceAddresses }}
  NoAnnounceAddresses = [{{ range $index, $element := .Values.node.config.light.configtoml.P2P.NoAnnounceAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  MutualPeers = {{ .Values.node.config.light.configtoml.P2P.MutualPeers }}
  PeerExchange = {{ .Values.node.config.light.configtoml.P2P.PeerExchange }}
  RoutingTableRefreshPeriod = "{{ .Values.node.config.light.configtoml.P2P.RoutingTableRefreshPeriod }}"
  [P2P.ConnManager]
    Low = {{ printf "%.0f" .Values.node.config.light.configtoml.P2P.ConnManager.Low }}
    High = {{ printf "%.0f" .Values.node.config.light.configtoml.P2P.ConnManager.High }}
    GracePeriod = "{{ .Values.node.config.light.configtoml.P2P.ConnManager.GracePeriod }}"
[RPC]
  Address = "{{ .Values.node.config.light.configtoml.RPC.Address }}"
  Port = "{{ .Values.node.config.light.configtoml.RPC.Port }}"
  SkipAuth = {{ .Values.node.config.light.configtoml.RPC.SkipAuth }}
[Gateway]
  Address = "{{ .Values.node.config.light.configtoml.Gateway.Address }}"
  Port = "{{ .Values.node.config.light.configtoml.Gateway.Port }}"
  Enabled = {{ .Values.node.config.light.configtoml.Gateway.Enabled }}
[Share]
  UseShareExchange = {{ .Values.node.config.light.configtoml.Share.UseShareExchange }}
  [Share.EDSStoreParams]
    GCInterval = "{{ .Values.node.config.light.configtoml.Share.EDSStoreParams.GCInterval }}"
    RecentBlocksCacheSize = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.EDSStoreParams.RecentBlocksCacheSize }}
    BlockstoreCacheSize = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.EDSStoreParams.BlockstoreCacheSize }}
  [Share.ShrExEDSParams]
    ServerReadTimeout = "{{ .Values.node.config.light.configtoml.Share.ShrExEDSParams.ServerReadTimeout }}"
    ServerWriteTimeout = "{{ .Values.node.config.light.configtoml.Share.ShrExEDSParams.ServerWriteTimeout }}"
    HandleRequestTimeout = "{{ .Values.node.config.light.configtoml.Share.ShrExEDSParams.HandleRequestTimeout }}"
    ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.ShrExEDSParams.ConcurrencyLimit }}
    BufferSize = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.ShrExEDSParams.BufferSize }}
  [Share.ShrExNDParams]
    ServerReadTimeout = "{{ .Values.node.config.light.configtoml.Share.ShrExNDParams.ServerReadTimeout }}"
    ServerWriteTimeout = "{{ .Values.node.config.light.configtoml.Share.ShrExNDParams.ServerWriteTimeout }}"
    HandleRequestTimeout = "{{ .Values.node.config.light.configtoml.Share.ShrExNDParams.HandleRequestTimeout }}"
    ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.ShrExNDParams.ConcurrencyLimit }}
  [Share.PeerManagerParams]
    PoolValidationTimeout = "{{ .Values.node.config.light.configtoml.Share.PeerManagerParams.PoolValidationTimeout }}"
    PeerCooldown = "{{ .Values.node.config.light.configtoml.Share.PeerManagerParams.PeerCooldown }}"
    GcInterval = "{{ .Values.node.config.light.configtoml.Share.PeerManagerParams.GcInterval }}"
    EnableBlackListing = {{ .Values.node.config.light.configtoml.Share.PeerManagerParams.EnableBlackListing }}
  [Share.LightAvailability]
    SampleAmount = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.LightAvailability.SampleAmount }}
  [Share.Discovery]
    PeersLimit = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.Discovery.PeersLimit }}
    AdvertiseInterval = "{{ .Values.node.config.light.configtoml.Share.Discovery.AdvertiseInterval }}"
[Header]
  TrustedHash = "{{ .Values.node.config.light.configtoml.Header.TrustedHash }}"
  TrustedPeers = {{ .Values.node.config.light.configtoml.Header.TrustedPeers }}
  [Header.Store]
    StoreCacheSize = {{ printf "%.0f" .Values.node.config.light.configtoml.Header.Store.StoreCacheSize }}
    IndexCacheSize = {{ printf "%.0f" .Values.node.config.light.configtoml.Header.Store.IndexCacheSize }}
    WriteBatchSize = {{ printf "%.0f" .Values.node.config.light.configtoml.Header.Store.WriteBatchSize }}
  [Header.Syncer]
    TrustingPeriod = "{{ .Values.node.config.light.configtoml.Header.Syncer.TrustingPeriod }}"
  [Header.Server]
    WriteDeadline = "{{ .Values.node.config.light.configtoml.Header.Server.WriteDeadline }}"
    ReadDeadline = "{{ .Values.node.config.light.configtoml.Header.Server.ReadDeadline }}"
    RangeRequestTimeout = "{{ .Values.node.config.light.configtoml.Header.Server.RangeRequestTimeout }}"
  [Header.Client]
    MaxHeadersPerRangeRequest = {{ printf "%.0f" .Values.node.config.light.configtoml.Header.Client.MaxHeadersPerRangeRequest }}
    RangeRequestTimeout = "{{ .Values.node.config.light.configtoml.Header.Client.RangeRequestTimeout }}"
[DASer]
  SamplingRange = {{ printf "%.0f" .Values.node.config.light.configtoml.DASer.SamplingRange }}
  ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.light.configtoml.DASer.ConcurrencyLimit }}
  BackgroundStoreInterval = "{{ .Values.node.config.light.configtoml.DASer.BackgroundStoreInterval }}"
  SampleFrom = {{ printf "%.0f" .Values.node.config.light.configtoml.DASer.SampleFrom }}
  SampleTimeout = "{{ .Values.node.config.light.configtoml.DASer.SampleTimeout }}"
[Pruner]
  EnableService = {{ .Values.node.config.light.configtoml.Pruner.EnableService }}
{{- end }}
