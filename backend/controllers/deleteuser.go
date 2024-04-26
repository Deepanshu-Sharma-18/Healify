package controllers

import (
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/Deepanshu-sharma-18/healify-backend/db"
	"github.com/Deepanshu-sharma-18/healify-backend/initializers"
	"github.com/gin-gonic/gin"
	"golang.org/x/net/context"
)

func DeleteUser(c *gin.Context) {
	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)
	defer cancel()

	type Username struct {
		Username string `bson:"username" json:"username" validate:"required"`
	}

	var username Username

	if err := c.BindJSON(&username); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	delete, err := initializers.Client.User.FindUnique(
		db.User.Username.Equals(username.Username),
	).With(db.User.Records.Fetch().With(db.Record.Reports.Fetch())).Exec(ctx)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	for i := 0; i < len(delete.Records()); i++ {

		for j := 0; j < len(delete.Records()[i].Reports()); j++ {
			_, err := initializers.Client.File.FindUnique(
				db.File.ID.Equals(delete.Records()[i].Reports()[j].ID),
			).Delete().Exec(ctx)

			if err != nil {
				c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			}
		}

		_, err := initializers.Client.Record.FindUnique(
			db.Record.ID.Equals(delete.Records()[i].ID),
		).Delete().Exec(ctx)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

	}

	result, _ := json.MarshalIndent(delete, "", "  ")
	fmt.Printf("delete: %s\n", result)

}
