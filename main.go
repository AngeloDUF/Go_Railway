// main.go
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hola desde Go")
}

func main() {
    // Configura el manejador para la ruta raíz "/"
    http.HandleFunc("/", handler)

    // Inicia el servidor en el puerto 8080
    fmt.Println("Servidor corriendo en el puerto 8080...")
    http.ListenAndServe(":8080", nil)
}
