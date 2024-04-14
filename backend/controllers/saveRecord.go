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

func SaveRecord(c *gin.Context) {
	ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)

	defer cancel()

	var record models.Record

	if err := c.BindJSON(&record); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	createdRecord, err := initializers.Client.Record.CreateOne(
		db.Record.Title.Set(record.Title),
		db.Record.Date.Set(record.Date),
		db.Record.User.Link(db.User.ID.Equals(record.UserId)),
		db.Record.Symptoms.Set(record.Symptoms),
		db.Record.Diagnosis.Set(record.Diagnosis),
		db.Record.Treatment.Set(record.Treatment),
		db.Record.Reports.Set(record.Reports),
	).Exec(ctx)

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	result, _ := json.MarshalIndent(createdRecord, "", "  ")
	fmt.Printf("created record: %s\n", result)

}
