# "Hello World" Project in Go with Docker

This project is a simple "Hello World" application in Go, running in a Docker container.

## Required Files

1. `main.go` - Main application file.
2. `Dockerfile` - Docker configuration file.

---

### Step 1: Create the `main.go` File

Create a file named `main.go` with the following content:

```go
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "Hello from Go")
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}
```

This file defines a basic Go application that displays the message "Hello from Go" at the root path (`/`).

---

### Step 2: Create the `Dockerfile`

In the same directory, create a file named `Dockerfile` with the following content:

```Dockerfile
# Use the official Go image
FROM golang:1.16

# Set the working directory in the container
WORKDIR /app

# Copy the code file into the container
COPY main.go .

# Build the application
RUN go build -o main .

# Expose port 8080
EXPOSE 8080

# Command to run the application
CMD ["./main"]
```

This `Dockerfile`:
- Uses an official Go image.
- Copies `main.go` into the container.
- Builds the Go application.
- Exposes port 8080 for the application.
- Runs the compiled application.

---

### Step 3: Build the Docker Image

In the terminal, navigate to the directory where you saved `main.go` and `Dockerfile`, and run the following command to build the image:

```bash
docker build -t go-app .
```

This will create an image named `go-app`.

---

### Step 4: Run the Container

Run the following command to start a container from the created image and bind it to port 8088 on your machine:

```bash
docker run -d -p 8088:8080 go-app
```

This command runs the container in the background (`-d`) and maps port 8088 on your local machine to port 8080 in the container.

---

### Step 5: Test the Application

Open your browser and go to [http://localhost:8088](http://localhost:8088). https://gorailway-production-19e6.up.railway.app/
