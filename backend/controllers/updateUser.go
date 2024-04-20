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

func UpdateUser(c *gin.Context) {
	var ctx, cancel = context.WithTimeout(context.Background(), 100*time.Second)
	defer cancel()

	type User struct {
		Id         string          `bson:"id" json:"id" validate:"required"`
		Name       string          `bson:"name" json:"name" validate:"required"`
		Username   string          `bson:"username" json:"username" validate:"required"`
		Height     string          `bson:"height" json:"height" validate:"required"`
		Weight     string          `bson:"weight" json:"weight" validate:"required"`
		Age        string          `bson:"age" json:"age" validate:"required"`
		Bloodgroup string          `bson:"bloodgroup" json:"bloodgroup" validate:"required"`
		Gender     string          `bson:"gender" json:"gender" validate:"required"`
		Records    []models.Record `bson:"records" json:"records"`
		Address    string          `bson:"address" json:"address" validate:"required"`
		Image      string          `bson:"image" json:"image"`
		AuthId     string          `bson:"authId" json:"authId" validate:"required"`
	}

	var user User

	if err := c.BindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	updateUser, err := initializers.Client.User.FindUnique(
		db.User.ID.Equals(user.Id),
	).Update(
		db.User.Name.Set(user.Name),
		db.User.Username.Set(user.Username),
		db.User.Address.Set(user.Address),
		db.User.Image.Set(user.Image),
		db.User.Height.Set(user.Height),
		db.User.Weight.Set(user.Weight),
		db.User.Age.Set(user.Age),
		db.User.Bloodgroup.Set(user.Bloodgroup),
		db.User.Gender.Set(user.Gender),
	).Exec(ctx)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	result, _ := json.MarshalIndent(updateUser, "", "  ")
	fmt.Printf("created post: %s\n", result)
}
