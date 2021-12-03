package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "[ %s ] Hello World from Go in minimal Docker container\r\n", currentTime.Format("2006-01-02 15:04:05"))
}

func main() {
	http.HandleFunc("/", helloHandler)

	fmt.Println("Started, serving at 8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		panic("ListenAndServe: " + err.Error())
	}
}
