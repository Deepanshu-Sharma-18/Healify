package controllers

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"github.com/Deepanshu-sharma-18/healify-backend/db"
	"github.com/Deepanshu-sharma-18/healify-backend/initializers"
	"github.com/Deepanshu-sharma-18/healify-backend/models"
	"github.com/gin-gonic/gin"
)

func SaveUser(c *gin.Context) {
	var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
	defer cancel()

	var user models.User

	if err := c.BindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	createdUser, err := initializers.Client.User.CreateOne(
		db.User.Name.Set(user.Name),
		db.User.Username.Set(user.Username),
		db.User.Address.Set(user.Address),
		db.User.Image.Set(user.Image),
		db.User.Age.Set(user.Age),
		db.User.Bloodgroup.Set(user.Bloodgroup),
		db.User.Gender.Set(user.Gender),
		db.User.Height.Set(user.Height),
		db.User.Weight.Set(user.Weight),
	).Exec(ctx)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	result, _ := json.MarshalIndent(createdUser, "", "  ")
	fmt.Printf("created post: %s\n", result)
}
