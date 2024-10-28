package main

import (
	"fmt"
	"log"
	"net"
	"net/http"
)

// 获取客户端IP地址
func getIP(r *http.Request) string {
	ip, _, err := net.SplitHostPort(r.RemoteAddr)
	if err != nil {
		return r.RemoteAddr
	}
	return ip
}

func handler(w http.ResponseWriter, r *http.Request) {
	ip := getIP(r)
	fmt.Fprintf(w, ip)
}

func main() {
	http.HandleFunc("/", handler)

	// 设置端口并启动服务
	log.Println("Starting server on :8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
