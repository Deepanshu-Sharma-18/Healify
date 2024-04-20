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

func UpdateRecord(c *gin.Context) {
	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)

	defer cancel()

	type Record struct {
		Id        string   `bson:"id" json:"id" validate:"required"`
		Title     string   `bson:"title" json:"title" validate:"required"`
		Date      string   `bson:"date" json:"date" validate:"required"`
		Symptoms  []string `bson:"symptoms" json:"symptoms" validate:"required"`
		Diagnosis []string `bson:"diagnosis" json:"diagnosis" validate:"required"`
		Treatment []string `bson:"treatment" json:"treatment" validate:"required"`
		Reports   []string `bson:"reports" json:"reports" validate:"required"`
		UserId    string   `bson:"userid" json:"userid" validate:"required"`
	}

	var record Record

	if err := c.BindJSON(&record); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	updateRecord, err := initializers.Client.Record.FindUnique(
		db.Record.ID.Equals(record.Id),
	).Update(
		db.Record.Title.Set(record.Title),
		db.Record.Date.Set(record.Date),
		db.Record.Symptoms.Set(record.Symptoms),
		db.Record.Diagnosis.Set(record.Diagnosis),
		db.Record.Treatment.Set(record.Treatment),
		db.Record.Reports.Set(record.Reports),
	).Exec(ctx)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	result, _ := json.MarshalIndent(updateRecord, "", "  ")
	fmt.Printf("updated record: %s\n", result)

}
