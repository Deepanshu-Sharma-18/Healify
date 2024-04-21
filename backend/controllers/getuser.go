package controllers

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/Deepanshu-sharma-18/healify-backend/db"
	"github.com/Deepanshu-sharma-18/healify-backend/initializers"
	"github.com/gin-gonic/gin"
)

func GetUser(c *gin.Context) {
	var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
	defer cancel()

	type Auth struct {
		AuthId string `bson:"authid" json:"authid" validate:"required"`
	}
	var auth Auth

	if err := c.BindJSON(&auth); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	post, err := initializers.Client.User.FindFirst(
		db.User.AuthID.Equals(auth.AuthId),
	).With(db.User.Records.Fetch().With(db.Record.Reports.Fetch())).Exec(ctx)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	result, _ := json.MarshalIndent(post, "", "  ")
	fmt.Printf("post: %s\n", result)
	c.JSON(http.StatusOK, gin.H{"data": post})
}
