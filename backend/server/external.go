package server

import (
	"fmt"
	"github.com/gorilla/mux"
	"github.com/tylerb/graceful"
	"log"
	"net/http"
	"runtime/debug"
	"time"
)

var (
	srv          *graceful.Server
	httpShutdown = make(chan struct{})
)

//StartServer starts the internal server
func StartServer() {
	log.Println("Starting HTTP Server accistency backend")
	defer doAPIPanicRecovery("accistency-backend")

	r := mux.NewRouter()

	srv = &graceful.Server{
		Server: &http.Server{
			Addr:           "0.0.0.0:8080",
			Handler:        r,
			ReadTimeout:    10 * time.Second,
			WriteTimeout:   50 * time.Second,
			MaxHeaderBytes: 1 << 20,
		},
		ShutdownInitiated: func() {
			// TODO:
		},
		Timeout: time.Second * 3,
	}
	err := srv.ListenAndServe()
	if err != nil {
		// TODO:
	}
	close(httpShutdown)

}

func doAPIPanicRecovery(serviceTag string) {
	if r := recover(); r != nil {
		fmt.Sprintf("%s%s service got exception, failed with error %s %s", "[url-shortner Alert]", serviceTag, r, string(debug.Stack()))
		// TODO:
	}
}

func stopHTTPServer() <-chan struct{} {
	return httpShutdown
}
