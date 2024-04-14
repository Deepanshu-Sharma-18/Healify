package initializers

import (
	"github.com/Deepanshu-sharma-18/healify-backend/db"
)

var Client *db.PrismaClient

func InitializePrisma() error {

	Client = db.NewClient()

	if err := Client.Prisma.Connect(); err != nil {
		return err
	}

	defer func() {
		if err := Client.Prisma.Disconnect(); err != nil {
			panic(err)
		}
	}()

	return nil
}
