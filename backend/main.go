package main

import (
	"os"

	"github.com/Deepanshu-sharma-18/healify-backend/controllers"
	"github.com/Deepanshu-sharma-18/healify-backend/initializers"
	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnv()
	initializers.InitPresignClient()
}

func main() {

	client := initializers.InitPrisma()

	defer func() {
		if err := client.Prisma.Disconnect(); err != nil {
			panic(err)
		}
	}()

	port := os.Getenv("PORT")

	if port == "" {
		port = "3000"
	}

	r := gin.Default()

	//User - CRUD
	r.POST("/saveUser", controllers.SaveUser)
	r.POST("/getUser", controllers.GetUser)
	r.DELETE("/deleteUser", controllers.DeleteUser)

	//Post - CRUD
	r.POST("/saveRecord", controllers.SaveRecord)
	r.POST("/getRecord", controllers.GetRecord)
	r.POST("/deleteRecord", controllers.DeleteRecord)

	//Presigned URL
	r.POST("/generateUploadPresignedUrl", controllers.GenerateUploadPresignedUrl)
	r.POST("/generateDownloadPresignedUrl", controllers.GenerateDownloadPresignUrl)

	r.Run()
}
