package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

var commitHash string

func handler(w http.ResponseWriter, r *http.Request) {
	hostname, err := os.Hostname()
	if err != nil {
		hostname = "Unknown"
	}

	fmt.Fprintf(w, "<h1>Go App Running</h1>")
	fmt.Fprintf(w, "<p><strong>Hostname:</strong> %s</p>", hostname)
	fmt.Fprintf(w, "<p><strong>Commit Hash:</strong> %s</p>", commitHash)
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Server running on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
