# ----------
# Host Reservation
# ----------
define dhcp::host (
  $ip,
  $mac,
  $host    = $name,
  $comment = ''
) {
  include dhcp::params

  $dhcp_dir = $dhcp::params::dhcp_dir

  concat::fragment { "dhcp_host_${name}":
    target  => "${dhcp_dir}/dhcpd.hosts",
    content => template('dhcp/dhcpd.host.erb'),
    order   => 10,
  }
}
