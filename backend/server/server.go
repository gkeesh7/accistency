package server

import "accistency/backend/utils/concurrencyutils"

// Start starts the server
func Start() {
	go StartServer()
}

// Stop stops all servers.
func Stop() <-chan struct{} {
	return concurrencyutils.WaitChannels(stopHTTPServer())
}
