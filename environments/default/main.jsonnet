local mimir = import "mimir/mimir.libsonnet";

mimir {
  _config+:: {
    namespace: "monitoring",
    storage_backend: 'gcs',
    blocks_storage_bucket_name: 'blocks-bucket',
    ruler_enabled: true,
    ruler_storage_backend: 'gcs',
    ruler_storage_bucket_name: 'ruler-bucket',
    autoscaling_prometheus_url: 'http://prometheus.default:9090/prometheus',
    // Enable queriers autoscaling.
    autoscaling_querier_enabled: true,
    autoscaling_querier_min_replicas: 10,
    autoscaling_querier_max_replicas: 40,
    // Enable ruler queriers autoscaling.
    autoscaling_ruler_querier_enabled: true,
    autoscaling_ruler_querier_min_replicas: 10,
    autoscaling_ruler_querier_max_replicas: 40,
    // Enable distributor autoscaling.
    autoscaling_distributor_enabled: true,
    autoscaling_distributor_min_replicas: 10,
    autoscaling_distributor_max_replicas: 40,
    node_selector: {
      workload: 'mimir',
    },
  },
}
