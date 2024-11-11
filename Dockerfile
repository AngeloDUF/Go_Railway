# Usa la imagen oficial de Go más reciente
FROM golang:1.19

# Establece el directorio de trabajo
WORKDIR /app

# Copia el archivo main.go al contenedor
COPY main.go .

# Establece las dependencias de Go (por si las hubiera)
RUN go mod init app && go mod tidy

# Compila el archivo Go
RUN go build -o main .

# Expone el puerto 8080
EXPOSE 8080

# Comando para ejecutar el archivo compilado
CMD ["./main"]
