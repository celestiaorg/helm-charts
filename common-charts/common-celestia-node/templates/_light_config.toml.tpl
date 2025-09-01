{{- define "common-celestia-node.light_config.toml" -}}
[Node]
  StartupTimeout = "{{ .Values.node.config.light.configtoml.Node.StartupTimeout }}"
  ShutdownTimeout = "{{ .Values.node.config.light.configtoml.Node.ShutdownTimeout }}"
[Core]
  IP = "{{ .Values.node.config.light.configtoml.Core.IP }}"
  Port = "{{ .Values.node.config.light.configtoml.Core.Port }}"
  TLSEnabled = {{ .Values.node.config.light.configtoml.Core.TLSEnabled }}
  XTokenPath = "{{ .Values.node.config.light.configtoml.Core.XTokenPath }}"
  AdditionalCoreEndpoints = {{ .Values.node.config.light.configtoml.Core.AdditionalCoreEndpoints }}
[State]
  DefaultKeyName = "{{ .Values.node.config.light.configtoml.State.DefaultKeyName }}"
  DefaultBackendName = "{{ .Values.node.config.light.configtoml.State.DefaultBackendName }}"
  EstimatorAddress = "{{ .Values.node.config.light.configtoml.State.EstimatorAddress }}"
  EnableEstimatorTLS = {{ .Values.node.config.light.configtoml.State.EnableEstimatorTLS }}
[P2P]
  ListenAddresses = [{{ range $index, $element := .Values.node.config.light.configtoml.P2P.ListenAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  AnnounceAddresses = {{ .Values.node.config.light.configtoml.P2P.AnnounceAddresses }}
  NoAnnounceAddresses = [{{ range $index, $element := .Values.node.config.light.configtoml.P2P.NoAnnounceAddresses }}{{ if $index }}, {{ end }}"{{ $element }}"{{ end }}]
  MutualPeers = {{ .Values.node.config.light.configtoml.P2P.MutualPeers }}
  PeerExchange = {{ .Values.node.config.light.configtoml.P2P.PeerExchange }}
  [P2P.ConnManager]
    Low = {{ printf "%.0f" .Values.node.config.light.configtoml.P2P.ConnManager.Low }}
    High = {{ printf "%.0f" .Values.node.config.light.configtoml.P2P.ConnManager.High }}
    GracePeriod = "{{ .Values.node.config.light.configtoml.P2P.ConnManager.GracePeriod }}"
[RPC]
  Address = "{{ .Values.node.config.light.configtoml.RPC.Address }}"
  Port = "{{ .Values.node.config.light.configtoml.RPC.Port }}"
  SkipAuth = {{ .Values.node.config.light.configtoml.RPC.SkipAuth }}
  [RPC.CORS]
    Enabled = {{ .Values.node.config.light.configtoml.RPC.CORS.Enabled }}
    AllowedOrigins = {{ .Values.node.config.light.configtoml.RPC.CORS.AllowedOrigins }}
    AllowedHeaders = {{ .Values.node.config.light.configtoml.RPC.CORS.AllowedHeaders }}
    AllowedMethods = {{ .Values.node.config.light.configtoml.RPC.CORS.AllowedMethods }}
[Share]
  BlockStoreCacheSize = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.BlockStoreCacheSize }}
  UseShareExchange = {{ .Values.node.config.light.configtoml.Share.UseShareExchange }}
  UseBitswap = {{ .Values.node.config.light.configtoml.Share.UseBitswap }}
  [Share.EDSStoreParams]
    RecentBlocksCacheSize = {{ printf "%.0f" .Values.node.config.light.configtoml.Share.EDSStoreParams.RecentBlocksCacheSize }}
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
    RequestTimeout = "{{ .Values.node.config.light.configtoml.Header.Server.RequestTimeout }}"
  [Header.Client]
    MaxHeadersPerRangeRequest = {{ printf "%.0f" .Values.node.config.light.configtoml.Header.Client.MaxHeadersPerRangeRequest }}
    RequestTimeout = "{{ .Values.node.config.light.configtoml.Header.Client.RequestTimeout }}"
[DASer]
  SamplingRange = {{ printf "%.0f" .Values.node.config.light.configtoml.DASer.SamplingRange }}
  ConcurrencyLimit = {{ printf "%.0f" .Values.node.config.light.configtoml.DASer.ConcurrencyLimit }}
  BackgroundStoreInterval = "{{ .Values.node.config.light.configtoml.DASer.BackgroundStoreInterval }}"
  SampleFrom = {{ printf "%.0f" .Values.node.config.light.configtoml.DASer.SampleFrom }}
  SampleTimeout = "{{ .Values.node.config.light.configtoml.DASer.SampleTimeout }}"
  Enabled = {{ .Values.node.config.light.configtoml.DASer.Enabled }}
{{- end }}
