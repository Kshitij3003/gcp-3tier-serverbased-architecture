output "log_sink_writer" {
  value = google_logging_project_sink.log_sink.writer_identity
}
