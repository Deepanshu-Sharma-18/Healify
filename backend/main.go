package main

import (
	"os"

	"github.com/Deepanshu-sharma-18/healify-backend/controllers"
	"github.com/Deepanshu-sharma-18/healify-backend/initializers"
	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnv()
	err := initializers.InitializePrisma()
	if err != nil {
		panic(err)
	}
}

func main() {

	port := os.Getenv("PORT")

	if port == "" {
		port = "3000"
	}

	r := gin.Default()

	r.POST("/saveUser", controllers.SaveUser)
	r.GET("/getUser", controllers.GetUser)
	r.DELETE("/deleteUser", controllers.DeleteUser)

	r.Run()
}
