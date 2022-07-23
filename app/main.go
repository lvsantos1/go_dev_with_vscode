package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

var greetings = "Olá revolucionários!"

func main() {
	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"greetings": greetings,
		})
	})
	r.Run()
}
