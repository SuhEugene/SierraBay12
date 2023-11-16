// Logging stuff //
/proc/rustg_log_close_all() return call(RUST_G, "log_close_all")()

// HTTP library stuff //
/proc/rustg_create_async_http_client() return call(RUST_G, "start_http_client")()
/proc/rustg_close_async_http_client() return call(RUST_G, "shutdown_http_client")()
