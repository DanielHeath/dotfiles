package main

import (
	"net/http"
	"net/http/httputil"
	"net/url"
)

func main() {
	u, err := url.Parse("http://127.0.0.1:3000/")
	if err != nil {
		panic(err)
	}
	err = http.ListenAndServe(":80", httputil.NewSingleHostReverseProxy(u))
	if err != nil {
		panic(err)
	}
	select {}
}
