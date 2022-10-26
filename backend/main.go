package main

import (
	"accistency/backend/server"
	"accistency/backend/utils/concurrencyutils"
	"os"
	"os/signal"
	"syscall"
)

func main() {
	server.Start()

	interrupt := make(chan os.Signal, 1)
	signal.Notify(interrupt, syscall.SIGINT, syscall.SIGTERM)
	<-interrupt

	concurrencyutils.WaitChannels(server.Stop())
}
