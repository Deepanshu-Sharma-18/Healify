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

func UpdateRecord(c *gin.Context) {
	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)

	defer cancel()

	var record models.Record

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
	).Exec(ctx)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	for i := 0; i < len(record.Reports); i++ {

		_, err := initializers.Client.File.FindUnique(
			db.File.ID.Equals(record.Reports[i].Id),
		).Update(
			db.File.BucketName.Set(record.Reports[i].BucketName),
			db.File.ObjectKey.Set(record.Reports[i].ObjectKey),
			db.File.Content.Set(record.Reports[i].Content),
			db.File.Username.Set(record.Reports[i].Username),
			db.File.Record.Link(db.Record.ID.Equals(record.UserId)),
		).Exec(ctx)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

	}

	result, _ := json.MarshalIndent(updateRecord, "", "  ")
	fmt.Printf("updated record: %s\n", result)

}
