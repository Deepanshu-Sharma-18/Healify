package initializers

import (
	"fmt"

	"github.com/Deepanshu-sharma-18/healify-backend/db"
)

var Client *db.PrismaClient

func InitPrisma() *db.PrismaClient {
	Client = db.NewClient()
	if err := Client.Prisma.Connect(); err != nil {
		panic(err)
	}
	fmt.Println("Connected to Prisma")
	return Client
}
