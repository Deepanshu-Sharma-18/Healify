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

	type Username struct {
		Username string `bson:"username" json:"username" validate:"required"`
	}
	var username Username

	if err := c.BindJSON(&username); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	post, err := initializers.Client.User.FindUnique(
		db.User.Username.Equals(username.Username),
	).With(db.User.Records.Fetch()).Exec(ctx)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	result, _ := json.MarshalIndent(post, "", "  ")
	fmt.Printf("post: %s\n", result)
	c.JSON(http.StatusOK, gin.H{"data": post})
}
