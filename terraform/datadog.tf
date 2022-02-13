resource "datadog_monitor" "check" {
  name    = "Redmine check"
  type    = "service check"
  message = "[FIRING] {{host.name}} not respond!"
  query   = "\"http.can_connect\".over(\"instance:check_redmine_status\").by(\"host\",\"instance\",\"url\").last(5).count_by_status()"
}
